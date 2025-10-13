import React, { useEffect, useState, useMemo, useCallback } from "react";
import { useLocation } from "react-router-dom";
import PageTitle from "../static/PageTitle/PageTitle";
import SearchIcon from "../../assets/img/SearchIcon.svg";
import CustomInput from "../static/Commons/CustomInput";
import useApiClients from "../../services/useApiClients";
import { useUserContext } from "../../contexts/UserContext";
import CustomButton from "../static/Commons/CustomButton";
import defaultImage from "../../assets/img/DefaultImg.png";
import { useFetchData } from "../../hooks/useFetchData";
import { GENDER, getColorForName } from "../../constants/constants";
import { useNavigate } from "react-router-dom";
import "./PatientVitalList.css";
import VitalManagementModal from "../SmartRxInsider/Vitals/VitalManagementModal";

const PatientVitalList = ({ onClick, patientId: overridePatientId }) => {
    const { state } = useLocation();
    const [search, setSearch] = useState("");
    const [debouncedSearch, setDebouncedSearch] = useState("");
    const navigate = useNavigate();

    const [currentPage, setCurrentPage] = useState(1);
    const [sortBy, setSortBy] = useState("name");
    const [sortDirection, setSortDirection] = useState("asc");
    const [itemsPerPage, setItemsPerPage] = useState(10);
    const { api } = useApiClients();
    const { user } = useUserContext();
    const loginUserId = Number(user?.jti);
    const selectedPatientId = overridePatientId || state?.patientId || null;
    const overrideUserId = state?.userId ? Number(state.userId) : null;
    
    // Get patient name from navigation state for dynamic page title
    const patientName = state?.patientName || null;

    const [expandedIndex, setExpandedIndex] = useState(null);

    // Debug log to track navigation mode
    useEffect(() => {
        console.log("=== PatientVitalList Component Loaded ===");
        console.log("Mode:", selectedPatientId ? "🔍 SINGLE PATIENT VIEW" : "📋 ALL PATIENTS VIEW");
        console.log("PatientId:", selectedPatientId || "null (all patients)");
        console.log("PatientName:", patientName || "N/A");
        console.log("Page Title:", selectedPatientId && patientName 
            ? `${patientName}'s Vital List`
            : selectedPatientId ? "Patient's Vital List" : "All Patient's Vital List"
        );
        console.log("=========================================");
    }, [selectedPatientId, patientName]);
    const [modalType, setModalType] = useState(null);
    const [selectedPatient, setSelectedPatient] = useState(null);

    const openModal = (type) => setModalType(type);
    const closeModal = () => setModalType(null);
    
    const fetchSmartRxVitalData = async ({ VitalName }) => {
        try {
            const response = await api.getVitalsByVitalName({ VitalName });
            return response;
        } catch (err) {
            console.error("API call failed:", err);
            return null;
        }
    };

    const handleOpenAddVital = (patient) => {
        setSelectedPatient({
            ...patient,
            fullName: `${patient.firstName} ${patient.lastName} ${patient.nickName}`,
            existingPatientId: patient.existingPatientId,
        });
        openModal("add");
    };

    const toggleExpand = (id) => {
        setExpandedIndex((prev) => (prev === id ? null : id));
    };

    // --- Sort helpers ---
    const getSortField = (sortBy) => {
        if (sortBy === "lowToHigh" || sortBy === "highToLow") return "age";
        if (sortBy === "yearAsc" || sortBy === "yearDesc") return "createdDate";
        if (sortBy === "alphabeticAsc" || sortBy === "alphabeticDesc")
            return "patientcode";
        if (sortBy === "name") return "name";
        return "patientcode";
    };

    const getSortDirection = (sortBy) => {
        if (
            sortBy === "lowToHigh" ||
            sortBy === "yearAsc" ||
            sortBy === "alphabeticAsc" ||
            sortBy === "name"
        )
            return "asc";
        if (
            sortBy === "highToLow" ||
            sortBy === "yearDesc" ||
            sortBy === "alphabeticDesc"
        )
            return "desc";
        return "asc";
    };

    
    const sortField = useMemo(() => getSortField(sortBy), [sortBy]);
    const sortDir = useMemo(() => getSortDirection(sortBy), [sortBy]);

    const createPatientProfilePayload = useMemo(
        () => ({
            userId: overrideUserId || Number(user?.jti),
            patientId: selectedPatientId,
            searchKeyword: debouncedSearch || null,
            searchColumn: null,
            pagingSorting: {
                pageNumber: currentPage,
                pageSize: itemsPerPage,
                sortBy: sortField,
                sortDirection: sortDir,
            },
        }),
        [
            user?.jti,
            overrideUserId,
            selectedPatientId,
            debouncedSearch,
            currentPage,
            itemsPerPage,
            sortField,
            sortDir,
        ],
    );

    const {
        data: vitalListData,
        isLoading: isVitalListLoading,
        error: vitalListError,
        refetch: vitalListRefetch,
    } = useFetchData(
        api.getPatientVitalListById,
        currentPage - 1,
        itemsPerPage,
        sortField,
        sortDir,
        createPatientProfilePayload,
        );

    const patientList = Array.isArray(vitalListData?.data)
        ? vitalListData.data.map((item) => ({
              ...item.patientInfo,
              totalPrescriptions: item.patientInfo.totalPrescriptions || 0,
              rxType: item.patientInfo.rxType || "SmartRx",
              prescriptionId: item.prescriptionId,
              vitals: item.vitals || [],
          }))
        : [];

    useEffect(() => {
        const timer = setTimeout(() => {
            setDebouncedSearch(search);
        }, 300);

        return () => clearTimeout(timer);
    }, [search]);

    // Dynamic page title based on whether viewing a single patient or all patients
    const pageTitle = selectedPatientId && patientName 
        ? `${patientName}'s Vital List`
        : selectedPatientId
            ? "Patient's Vital List"
            : "All Patient's Vital List";

    return (
        <>
            <div className="content-container">
                <div className="rx-folder-container row px-3 px-md-5">
                    <div className="col-12 col-md-9 col-lg-7 col-xl-6 mx-auto p-0">
                        <PageTitle pageName={pageTitle} />

                        <div className="d-flex justify-content-between align-items-center">
                            <CustomInput
                                className={"w-100"}
                                rightIcon={SearchIcon}
                                name="search"
                                type="text"
                                placeholder="Search"
                                value={search}
                                onChange={(e) => setSearch(e.target.value)}
                                minHeight="0px"
                            />
                        </div>

                        <div className="d-flex justify-content-between align-items-center mt-3 mb-2">
                            <div className="d-flex align-items-center gap-2">
                                <label
                                    className="form-label mb-0"
                                    htmlFor="sort-by-select"
                                >
                                    Sort by:
                                </label>
                                <select
                                    id="sort-by-select"
                                    className="form-select form-select-sm"
                                    style={{
                                        width: "50px",
                                        minWidth: "160px",
                                        marginRight: "5px",
                                    }}
                                    value={sortBy}
                                    onChange={(e) => {
                                        setSortBy(e.target.value);
                                        setCurrentPage(1);
                                    }}
                                >
                                    <option value="alphabeticAsc">
                                        Name: A to Z
                                    </option>
                                    <option value="alphabeticDesc">
                                        Name: Z to A
                                    </option>
                                    <option value="yearAsc">
                                        Date: Oldest First
                                    </option>
                                    <option value="yearDesc">
                                        Date: Newest First
                                    </option>
                                    <option value="lowToHigh">
                                        Age: Low to High
                                    </option>
                                    <option value="highToLow">
                                        Age: High to Low
                                    </option>
                                </select>
                            </div>
                            <div className="d-flex align-items-center gap-2">
                                <label
                                    className="form-label mb-0"
                                    htmlFor="items-per-page-select"
                                >
                                    Show:
                                </label>
                                <select
                                    id="items-per-page-select"
                                    className="form-select form-select-sm"
                                    style={{ width: "auto", minWidth: "60px" }}
                                    value={itemsPerPage}
                                    onChange={(e) => {
                                        setItemsPerPage(Number(e.target.value));
                                        setCurrentPage(1);
                                    }}
                                >
                                    <option value={10}>10</option>
                                    <option value={20}>20</option>
                                    <option value={50}>50</option>
                                    <option value={100}>100</option>
                                </select>
                            </div>
                        </div>

                        <div className="menu-content">
                            {isVitalListLoading ? (
                                <p
                                    style={{
                                        textAlign: "center",
                                        marginTop: "20px",
                                    }}
                                >
                                    Loading patients...
                                </p>
                            ) : patientList.length === 0 ? (
                                <p
                                    style={{
                                        textAlign: "center",
                                        marginTop: "20px",
                                    }}
                                >
                                    No patients found
                                </p>
                            ) : (
                                patientList
                                    .filter((p) =>
                                        `${p.firstName} ${p.lastName}`
                                            .toLowerCase()
                                            .includes(
                                                debouncedSearch.toLowerCase(),
                                            ),
                                    )
                                    .map((patient) => {
                                        // Generate patient full name and initials
                                        const fullName = `${patient.firstName || ""} ${patient.lastName || ""}`.trim();
                                        const initials = fullName
                                            .split(" ")
                                            .map((n) => n[0] || "")
                                            .join("")
                                            .substring(0, 2)
                                            .toUpperCase() || "P";
                                        
                                        const backgroundColor = getColorForName(fullName);

                                        return (
                                        <div
                                            key={patient.id}
                                            className={`patient-list-item ${expandedIndex === patient.id ? "expanded" : ""}`}
                                            onClick={() =>
                                                toggleExpand(patient.id)
                                            }
                                        >
                                            <div className="patient-avatar">
                                                {patient?.profilePhotoPath ? (
                                                    <img
                                                        src={patient.profilePhotoPath}
                                                        alt={`${patient.firstName} ${patient.lastName}`}
                                                        className="avatar-image"
                                                        onError={(e) => {
                                                            e.target.style.display = 'none';
                                                            e.target.nextSibling.style.display = 'flex';
                                                        }}
                                                    />
                                                ) : null}
                                                <div
                                                    className="avatar-initials"
                                                    style={{
                                                        display: patient?.profilePhotoPath ? 'none' : 'flex',
                                                        backgroundColor: backgroundColor,
                                                        width: '48px',
                                                        height: '48px',
                                                        borderRadius: '50%',
                                                        alignItems: 'center',
                                                        justifyContent: 'center',
                                                        color: 'white',
                                                        fontSize: '20px',
                                                        fontWeight: 'bold',
                                                        fontFamily: 'Georama',
                                                        border: '2px solid #E5E5E5',
                                                    }}
                                                >
                                                    {initials}
                                                </div>
                                            </div>

                                            <div className="patient-details">
                                                <div className="patient-info">
                                                    <span>Name:</span>{" "}
                                                    <span>
                                                        {patient.firstName}{" "}
                                                        {patient.lastName}{" "}
                                                        {patient.nickName}
                                                    </span>
                                                </div>
                                                <div className="patient-info">
                                                    <span>Age:</span>{" "}
                                                    <span>
                                                        {patient.age || "N/A"}
                                                    </span>
                                                </div>
                                                <div className="patient-info">
                                                    <span>Gender:</span>{" "}
                                                    <span>
                                                        {GENDER[
                                                            patient.gender
                                                        ] || "Other"}
                                                    </span>
                                                </div>
                                            </div>

                                            <div className="patient-status">
                                                <div
                                                    className="status-badge-container"
                                                    role="button"
                                                    // onClick={(e) => {
                                                    //     e.stopPropagation();
                                                    //     navigate(
                                                    //         `/browse-rx/smart-prescription-list`,
                                                    //         {
                                                    //             state: {
                                                    //                 UserId: Number(
                                                    //                     user?.jti,
                                                    //                 ),
                                                    //                 patientId:
                                                    //                     patient.id,
                                                    //                 prescriptionType:
                                                    //                     "smartrx",
                                                    //                 prescriptionOwner: `${patient.firstName} ${patient.lastName}`,
                                                    //             },
                                                    //         },
                                                    //     );
                                                    // }}
                                                >
                                                    <div
                                                        style={{
                                                            borderRadius: "3px",
                                                            backgroundColor:
                                                                "#008000",
                                                            display:
                                                                "inline-block",
                                                            padding: "8px",
                                                            color: "white",
                                                            fontFamily:
                                                                "Georama",
                                                            fontWeight: "700",
                                                            fontSize: "10px",
                                                            lineHeight: "96.3%",
                                                            width: "100%",
                                                            textAlign: "center",
                                                            letterSpacing:
                                                                "0.5px",
                                                            minWidth: "70px",
                                                        }}
                                                    >
                                                        Total Vital
                                                    </div>

                                                    <div
                                                        role="button"
                                                        className="total-count"
                                                        style={{
                                                            fontFamily:
                                                                "Georama",
                                                        }}
                                                    >
                                                        {patient?.vitals
                                                            ? new Set(
                                                                  patient.vitals.map(
                                                                      (v) =>
                                                                          v.vitalName,
                                                                  ),
                                                              ).size
                                                            : 0}{" "}
                                                        Total
                                                    </div>
                                                </div>
                                            </div>

                                            <div
                                                className={`button-group-wrapper d-flex justify-content-between gap-2 w-100 ${
                                                    expandedIndex === patient.id
                                                        ? "show mt-0"
                                                        : ""
                                                }`}
                                            >
                                                <CustomButton
                                                    type="button"
                                                    label="View"
                                                    onClick={(e) => {
                                                        e.stopPropagation();
                                                        navigate(
                                                            "/patientVitals",
                                                            {
                                                                state: {
                                                                    patient,
                                                                },
                                                            },
                                                        );
                                                    }}
                                                    width="200px"
                                                    height="25px"
                                                    textColor="var(--theme-font-color)"
                                                    shape="roundedSquare"
                                                    borderColor="1px solid var(--theme-font-color)"
                                                    backgroundColor="#FAF8FA"
                                                    labelStyle={{
                                                        fontSize: "13px",
                                                        fontWeight: "500",
                                                        fontFamily: "Georama",
                                                    }}
                                                />
                                                <CustomButton
                                                    type="button"
                                                    label="Add"
                                                    onClick={(e) => {
                                                        e.stopPropagation();
                                                        handleOpenAddVital(
                                                            patient,
                                                        );
                                                    }}
                                                    width="200px"
                                                    height="25px"
                                                    textColor="var(--theme-font-color)"
                                                    shape="roundedSquare"
                                                    borderColor="1px solid var(--theme-font-color)"
                                                    backgroundColor="#FAF8FA"
                                                    labelStyle={{
                                                        fontSize: "13px",
                                                        fontWeight: "500",
                                                        fontFamily: "Georama",
                                                    }}
                                                />
                                            </div>
                                        </div>
                                        );
                                    })
                            )}

                            {patientList.length > 0 && (
                                <div className="mt-4">
                                    <div className="d-flex justify-content-between align-items-center mb-2">
                                        <div className="text-muted">
                                            {`Showing ${(currentPage - 1) * itemsPerPage + 1} to ${Math.min(
                                                currentPage * itemsPerPage,
                                                vitalListData?.totalRecords ||
                                                    patientList.length,
                                            )} of ${vitalListData?.totalRecords || patientList.length} patients`}
                                        </div>
                                    </div>
                                    {vitalListData?.totalRecords >
                                        itemsPerPage && (
                                        <div className="d-flex justify-content-center">
                                            <nav>
                                                <ul className="pagination pagination-sm">
                                                    <li
                                                        className={`page-item ${currentPage === 1 ? "disabled" : ""}`}
                                                    >
                                                        <button
                                                            className="page-link"
                                                            onClick={() =>
                                                                setCurrentPage(
                                                                    (prev) =>
                                                                        Math.max(
                                                                            1,
                                                                            prev -
                                                                                1,
                                                                        ),
                                                                )
                                                            }
                                                            disabled={
                                                                currentPage ===
                                                                1
                                                            }
                                                        >
                                                            Previous
                                                        </button>
                                                    </li>

                                                    {Array.from(
                                                        {
                                                            length: Math.ceil(
                                                                (vitalListData?.totalRecords ||
                                                                    patientList.length) /
                                                                    itemsPerPage,
                                                            ),
                                                        },
                                                        (_, i) => i + 1,
                                                    )
                                                        .filter(
                                                            (page) =>
                                                                page === 1 ||
                                                                page ===
                                                                    Math.ceil(
                                                                        (vitalListData?.totalRecords ||
                                                                            patientList.length) /
                                                                            itemsPerPage,
                                                                    ) ||
                                                                Math.abs(
                                                                    page -
                                                                        currentPage,
                                                                ) <= 2,
                                                        )
                                                        .map(
                                                            (
                                                                page,
                                                                idx,
                                                                arr,
                                                            ) => (
                                                                <React.Fragment
                                                                    key={page}
                                                                >
                                                                    {idx > 0 &&
                                                                        arr[
                                                                            idx -
                                                                                1
                                                                        ] !==
                                                                            page -
                                                                                1 && (
                                                                            <li className="page-item disabled">
                                                                                <span className="page-link">
                                                                                    ...
                                                                                </span>
                                                                            </li>
                                                                        )}
                                                                    <li
                                                                        className={`page-item ${currentPage === page ? "active" : ""}`}
                                                                    >
                                                                        <button
                                                                            className="page-link"
                                                                            onClick={() =>
                                                                                setCurrentPage(
                                                                                    page,
                                                                                )
                                                                            }
                                                                        >
                                                                            {
                                                                                page
                                                                            }
                                                                        </button>
                                                                    </li>
                                                                </React.Fragment>
                                                            ),
                                                        )}

                                                    <li
                                                        className={`page-item ${
                                                            currentPage ===
                                                            Math.ceil(
                                                                (vitalListData?.totalRecords ||
                                                                    patientList.length) /
                                                                    itemsPerPage,
                                                            )
                                                                ? "disabled"
                                                                : ""
                                                        }`}
                                                    >
                                                        <button
                                                            className="page-link"
                                                            onClick={() =>
                                                                setCurrentPage(
                                                                    (prev) =>
                                                                        Math.min(
                                                                            Math.ceil(
                                                                                (vitalListData?.totalRecords ||
                                                                                    patientList.length) /
                                                                                    itemsPerPage,
                                                                            ),
                                                                            prev +
                                                                                1,
                                                                        ),
                                                                )
                                                            }
                                                            disabled={
                                                                currentPage ===
                                                                Math.ceil(
                                                                    (vitalListData?.totalRecords ||
                                                                        patientList.length) /
                                                                        itemsPerPage,
                                                                )
                                                            }
                                                        >
                                                            Next
                                                        </button>
                                                    </li>
                                                </ul>
                                            </nav>
                                        </div>
                                    )}
                                </div>
                            )}
                        </div>
                    </div>
                </div>
            </div>

            <VitalManagementModal
                modalType={modalType}
                isOpen={modalType === "add"}
                folderData={null}
                vitalData={null}
                onClose={closeModal}
                fetchSmartRxVitalData={fetchSmartRxVitalData}
                smartRxInsiderAgeData={selectedPatient?.age}
                smartRxInsiderGenderData={selectedPatient?.gender}
                anotherButton={"true"}
                smartRxMasterId={selectedPatient?.existingPatientId}
                prescriptionId={selectedPatient?.prescriptionId}
                refetch={vitalListRefetch}
                smartRxInsiderVitalData={selectedPatient?.vitals}
                patientFullName={selectedPatient?.fullName}
            />
        </>
    );
};

export default PatientVitalList;
