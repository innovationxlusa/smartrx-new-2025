import React, { useEffect, useMemo, useState } from "react";
import useApiClients from "../../services/useApiClients";
import { useUserContext } from "../../contexts/UserContext";
import PageTitle from "../static/PageTitle/PageTitle";
import CustomInput from "../static/Commons/CustomInput";
import SearchIcon from "../../assets/img/SearchIcon.svg";
import defaultImage from "../../assets/img/DefaultImg.png";
import { useFetchData } from "../../hooks/useFetchData";
import { useParams, useNavigate, useLocation } from "react-router-dom";
import CustomButton from "../static/Commons/CustomButton";
import { getColorForName } from "../../constants/constants";
import "./PatientVitalList.css";

/**
 * DoctorProfileList Component
 * 
 * Displays a list of doctors with two distinct modes:
 * 
 * MODE 1 - ALL DOCTORS (Default/Dashboard View):
 * - Shows all doctors associated with the logged-in user
 * - Navigation State Required: { userId: number }
 * - PatientId is null
 * - Use Case: User wants to see all their doctors across all patients
 * 
 * MODE 2 - SINGLE PATIENT'S DOCTORS:
 * - Shows only doctors who have treated a specific patient
 * - Navigation State Required: { userId: number, patientId: number, patientName?: string }
 * - PatientId is provided
 * - Use Case: User selects a patient and wants to see which doctors have treated them
 * 
 * Navigation Examples:
 * // Show all doctors
 * navigate("/doctor-profile-list", { state: { userId: 123 } })
 * 
 * // Show doctors for specific patient
 * navigate("/doctor-profile-list", { 
 *   state: { 
 *     userId: 123, 
 *     patientId: 456,
 *     patientName: "John Doe" 
 *   } 
 * })
 */
const DoctorProfileList = () => {
    const { api } = useApiClients();
    const { user } = useUserContext();
    const location = useLocation();
    const navigate = useNavigate();
    const [search, setSearch] = useState("");
    const [debouncedSearch, setDebouncedSearch] = useState("");
    const [currentPage, setCurrentPage] = useState(1);
    const [itemsPerPage, setItemsPerPage] = useState(10);
    const [sortBy, setSortBy] = useState("alphabeticAsc");

    // Get userId from navigation state or user context
    const userId = Number(location.state?.userId ?? user?.jti);
    
    // Get patientId from navigation state (null for "All Patients" view)
    // IMPORTANT: 
    // - If patientId is NULL: API returns ALL doctors for userId
    // - If patientId is PROVIDED: API returns only doctors who have treated THIS SPECIFIC patient (userId + patientId combination)
    const patientId = location.state?.patientId ?? null;
    const patientName = location.state?.patientName ?? null; // Optional: to display patient name in title

    useEffect(() => {
        const t = setTimeout(() => setDebouncedSearch(search), 300);
        return () => clearTimeout(t);
    }, [search]);

    // Debug log to track component mode and API parameters
    useEffect(() => {
        console.log("=== DoctorProfileList Component Loaded ===");
        console.log("Mode:", patientId ? "🔍 SINGLE PATIENT VIEW" : "📋 ALL DOCTORS VIEW");
        console.log("UserId:", userId);
        console.log("PatientId:", patientId || "null (all patients)");
        console.log("PatientName:", patientName || "N/A");
        console.log("Expected Result:", patientId 
            ? `Doctors who treated patient ID ${patientId} for user ID ${userId}`
            : `All doctors for user ID ${userId}`
        );
        console.log("==========================================");
    }, [userId, patientId, patientName]);

    // Helper functions for sorting
    const getSortField = (sortBy) => {
        if (sortBy === "lowToHigh" || sortBy === "highToLow") return "age";
        if (sortBy === "yearAsc" || sortBy === "yearDesc") return "createdDate";
        if (sortBy === "alphabeticAsc" || sortBy === "alphabeticDesc") return "patientcode";
        return "patientcode";
    };

    const getSortDirection = (sortBy) => {
        if (
            sortBy === "lowToHigh" ||
            sortBy === "yearAsc" ||
            sortBy === "alphabeticAsc"
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

    // Payload structure for API call:
    // TWO SCENARIOS:
    // 1. Single Patient View (patientId is provided):
    //    - userId: Current logged-in user ID
    //    - PatientId: Specific patient ID -> API returns doctors associated with BOTH userId AND this patientId
    //    - Purpose: Show only doctors who have treated this specific patient
    //
    // 2. All Patients View (patientId is null):
    //    - userId: Current logged-in user ID
    //    - PatientId: null -> API returns ALL doctors associated with this userId
    //    - Purpose: Show all doctors the user has worked with across all patients
    const payload = useMemo(() => {
        const apiPayload = {
            userId: userId,
            PatientId: patientId, // null = all doctors for user, number = doctors for specific patient
            RxType: "Smart Rx",
            searchKeyword: debouncedSearch || null,
            searchColumn: null,
            pagingSorting: {
                pageNumber: currentPage,
                pageSize: itemsPerPage,
                sortBy: getSortField(sortBy),
                sortDirection: getSortDirection(sortBy),
            },
        };

        console.log("DoctorProfileList API Payload:", {
            ...apiPayload,
            description: patientId 
                ? `Fetching doctors for userId: ${userId} AND patientId: ${patientId}` 
                : `Fetching ALL doctors for userId: ${userId}`
        });

        return apiPayload;
    }, [userId, patientId, debouncedSearch, currentPage, itemsPerPage, sortBy]);

    const { data, isLoading, error, refetch } = useFetchData(
        api.getDoctorProfilesByUserId,
        0,
        0,
        null,
        null,
        payload
    );

    const profiles = Array.isArray(data?.data) ? data.data : [];

    // Derived, sorted, paginated list (client-side)
    const getSortedProfiles = (list) => {
        const arr = [...list];
        if (sortBy === "alphabeticAsc" || sortBy === "alphabeticDesc") {
            arr.sort((a, b) => {
                const aName = `${a?.doctorFirstName || ""} ${a?.doctorLastName || ""}`.trim().toLowerCase();
                const bName = `${b?.doctorFirstName || ""} ${b?.doctorLastName || ""}`.trim().toLowerCase();
                if (aName < bName) return sortBy === "alphabeticAsc" ? -1 : 1;
                if (aName > bName) return sortBy === "alphabeticAsc" ? 1 : -1;
                return 0;
            });
        }
        return arr;
    };

    const filtered = profiles.filter((d) =>
        `${d?.doctorFirstName || ""} ${d?.doctorLastName || ""}`
            .toLowerCase()
            .includes((debouncedSearch || "").toLowerCase())
    );
    const sorted = getSortedProfiles(filtered);
    const totalRecords = sorted.length;
    const startIndex = (currentPage - 1) * itemsPerPage;
    const endIndex = Math.min(startIndex + itemsPerPage, totalRecords);
    const pageItems = sorted.slice(startIndex, endIndex);

    const [expandedIndex, setExpandedIndex] = useState(null);

    const toggleExpand = (id) => {
        setExpandedIndex((prev) => (prev === id ? null : id));
    };

    // Dynamic page title based on view mode
    const pageTitle = patientId 
        ? patientName 
            ? `Doctors for ${patientName}` 
            : "Patient's Doctors"
        : "All Doctors";

    return (
        <div className="content-container">
            <div className="rx-folder-container row px-3 px-md-5">
                <div className="col-12 col-md-9 col-lg-7 col-xl-6 mx-auto p-0">
                    <PageTitle pageName={pageTitle} />
                  
                    {/* Sorting and Items Per Page Controls */}
                    {/* Search + Sort row */}
                    <div className="d-flex align-items-center justify-content-between gap-2 mt-3 mb-2">
                        <div className="flex-grow-1">
                            <CustomInput
                                className={"w-100"}
                                icon={SearchIcon}
                                iconPosition="left"
                                name="search"
                                type="text"
                                placeholder="Search"
                                value={search}
                                onChange={(e) => setSearch(e.target.value)}
                                minHeight="0px"
                                style={{
                                    border: "1px solid #E0E3E7",
                                    borderRadius: "12px",
                                    padding: "10px 14px 10px 40px",
                                    fontSize: "16px",
                                    color: "#4B5563",
                                    boxShadow: "0 1px 2px rgba(16,24,40,0.05)",
                                }}
                            />
                        </div>
                        <div className="d-flex align-items-center gap-2">
                            <label className="form-label mb-0" htmlFor="sort-by-select" style={{ whiteSpace: "nowrap" }}>
                                Sort by:
                            </label>
                            <select
                                id="sort-by-select"
                                className="form-select form-select-sm"
                                style={{ width: "160px" }}
                                value={sortBy}
                                onChange={(e) => {
                                    setSortBy(e.target.value);
                                    setCurrentPage(1);
                                }}
                            >
                                <option value="alphabeticAsc">Name: A to Z</option>
                                <option value="alphabeticDesc">Name: Z to A</option>
                            </select>
                        </div>
                    </div>

                    <div className="menu-content">
                        {isLoading ? (
                            <p style={{ textAlign: "center", marginTop: 20 }}>
                                Loading {patientId ? "patient's doctors" : "all doctors"}...
                            </p>
                        ) : totalRecords === 0 ? (
                            <div style={{ textAlign: "center", marginTop: 20, padding: "20px" }}>
                                <p style={{ fontSize: "16px", color: "#666", marginBottom: "10px" }}>
                                    {patientId 
                                        ? `No doctors found for ${patientName || "this patient"}`
                                        : "No doctors found"}
                                </p>
                                <p style={{ fontSize: "14px", color: "#999" }}>
                                    {patientId 
                                        ? "This patient hasn't been assigned to any doctors yet."
                                        : "You haven't added any doctors yet."}
                                </p>
                            </div>
                        ) : (
                            pageItems.map((doc) => {
                                // Generate doctor full name and initials
                                const fullName = `${doc?.doctorFirstName || ""} ${doc?.doctorLastName || ""}`.trim();
                                const initials = fullName
                                    .split(" ")
                                    .map((n) => n[0] || "")
                                    .join("")
                                    .substring(0, 2)
                                    .toUpperCase() || "D";
                                
                                const backgroundColor = getColorForName(fullName);

                                return (
                                <div
                                    key={doc?.doctorId || `${doc?.doctorFirstName}-${doc?.doctorLastName}`}
                                    className={`patient-list-item ${expandedIndex === (doc?.doctorId ?? doc?.id) ? "expanded" : ""}`}
                                    onClick={() => toggleExpand(doc?.doctorId ?? doc?.id)}
                                >
                                    <div className="patient-avatar">
                                        {doc?.profilePhotoPath ? (
                                            <img
                                                src={doc.profilePhotoPath}
                                                alt={`${doc?.doctorFirstName} ${doc?.doctorLastName}`}
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
                                                display: doc?.profilePhotoPath ? 'none' : 'flex',
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
                                        <div className="patient-info"><span>Name:</span> <span>{doc?.doctorTitle} {doc?.doctorFirstName} {doc?.doctorLastName}</span></div>
                                        <div className="patient-info"><span>Specialty:</span> <span>{doc?.specialization || "N/A"}</span></div>
                                        <div className="patient-info"><span>Chamber:</span> <span>{doc?.chamberName || "N/A"}</span></div>
                                    </div>

                                    <div className="patient-status">
                                        <div
                                            className="status-badge-container"
                                            role="button"
                                            onClick={(e) => {
                                                e.stopPropagation();
                                                const type = "smart-prescription-list";
                                                const prescriptionType = "smartrx";
                                                const owner = `${doc?.doctorTitle || ""} ${doc?.doctorFirstName || ""} ${doc?.doctorLastName || ""}`.trim();
                                                navigate(`/browse-rx/${type}`,
                                                    {
                                                        state: {
                                                            UserId: Number(user?.jti),
                                                            patientId: null,
                                                            prescriptionType,
                                                            prescriptionOwner: owner || null,
                                                        },
                                                    },
                                                );
                                            }}
                                        >
                                            <div
                                                style={{
                                                    borderRadius: "3px",
                                                    backgroundColor: "#008000",
                                                    display: "inline-block",
                                                    padding: "8px",
                                                    color: "white",
                                                    fontWeight: "700",
                                                    fontSize: "10px",
                                                    lineHeight: "96.3%",
                                                    width: "100%",
                                                    textAlign: "center",
                                                    letterSpacing: "0.5px",
                                                    textTransform: "uppercase",
                                                    minWidth: "70.25px",
                                                }}
                                            >
                                                Smart RX
                                            </div>

                                            <div
                                                role="button"
                                                className="total-count"
                                                onClick={(e) => {
                                                    e.stopPropagation();
                                                    const type = "smart-prescription-list";
                                                    const prescriptionType = "smartrx";
                                                    const owner = `${doc?.doctorTitle || ""} ${doc?.doctorFirstName || ""} ${doc?.doctorLastName || ""}`.trim();
                                                    navigate(`/browse-rx/${type}`,
                                                        {
                                                            state: {
                                                                UserId: Number(user?.jti),
                                                                patientId: null,
                                                                prescriptionType,
                                                                prescriptionOwner: owner || null,
                                                            },
                                                        },
                                                    );
                                                }}
                                            >
                                                {doc?.smartRxCount || 0} Total
                                            </div>
                                        </div>
                                    </div>

                                    {/* Expanded action buttons */}
                                    <div
                                        className={`button-group-wrapper d-flex justify-content-between gap-2 w-100 ${
                                            expandedIndex === (doc?.doctorId ?? doc?.id) ? "show mt-0" : ""
                                        }`}
                                    >
                                        <CustomButton
                                            type="button"
                                            label="Profile View"
                                            onClick={(e) => {
                                                e.stopPropagation();
                                                navigate("/doctorProfile", {
                                                    state: { doctorId: doc?.doctorId ?? doc?.id },
                                                });
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
                                            label="Browse Rx"
                                            onClick={(e) => {
            									e.stopPropagation();
                                                const type = "smart-prescription-list";
                                                const prescriptionType = "smartrx";
                                                const owner = `${doc?.doctorTitle || ""} ${doc?.doctorFirstName || ""} ${doc?.doctorLastName || ""}`.trim();
                                                navigate(`/browse-rx/${type}`, {
                                                    state: {
                                                        UserId: Number(user?.jti),
                                                        patientId: null,
                                                        prescriptionType,
                                                        prescriptionOwner: owner || null,
                                                    },
                                                });
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
                        {/* Pagination Controls */}
                        {totalRecords > 0 && (
                            <div className="mt-4">
                                {/* <div className="d-flex justify-content-between align-items-center mb-2">
                                    <div className="text-muted">
                                        {`Showing ${totalRecords === 0 ? 0 : startIndex + 1} to ${endIndex} of ${totalRecords} doctors`}
                                    </div>
                                </div> */}
                                {console.log("Total: ",totalRecords, "Item per page: ", itemsPerPage)}
                                 {totalRecords > 0 && (
                                     <div className="d-flex justify-content-between align-items-center">
                                         <nav className="align-items-center" >
                                            <ul className="pagination pagination-sm">
                                                <li className={`page-item ${currentPage === 1 ? "disabled" : ""}`}>
                                                    <button
                                                        className="page-link"
                                                        onClick={() => setCurrentPage((prev) => Math.max(1, prev - 1))}
                                                        disabled={currentPage === 1}
                                                    >
                                                        Previous
                                                    </button>
                                                </li>
                                                 {Array.from({ length: Math.ceil(totalRecords / itemsPerPage) }, (_, i) => i + 1)
                                                     .filter((page) =>
                                                         page === 1 ||
                                                         page === Math.ceil(totalRecords / itemsPerPage) ||
                                                         Math.abs(page - currentPage) <= 2
                                                     )
                                                     .map((page, index, array) => (
                                                         <React.Fragment key={page}>
                                                             {index > 0 && array[index - 1] !== page - 1 && (
                                                                 <li className="page-item disabled">
                                                                     <span className="page-link">...</span>
                                                                 </li>
                                                             )}
                                                             <li className="page-item border-0">
                                                                 <button
                                                                     className="btn p-0 d-inline-flex align-items-center justify-content-center"
                                                                     onClick={() => setCurrentPage(page)}
                                                                     aria-current={currentPage === page ? "page" : undefined}
                                                                     style={{
                                                                         width: "28px",
                                                                         height: "28px",
                                                                         borderRadius: "50%",
                                                                         border: "1px solid var(--theme-font-color)",
                                                                         background: "var(--app-theme-color)",
                                                                         color: "#fff",
                                                                         fontWeight: currentPage === page ? 700 : 500,
                                                                         marginInline: "4px",
                                                                         lineHeight: 1,
                                                                     }}
                                                                     title={`Go to page ${page}`}
                                                                 >
                                                                     {page}
                                                                 </button>
                                                             </li>
                                                         </React.Fragment>
                                                     ))}
                                                <li className={`page-item ${currentPage === Math.ceil(totalRecords / itemsPerPage) ? "disabled" : ""}`}>
                                                    <button
                                                        className="page-link"
                                                        onClick={() => setCurrentPage((prev) => Math.min(Math.ceil(totalRecords / itemsPerPage), prev + 1))}
                                                        disabled={currentPage === Math.ceil(totalRecords / itemsPerPage)}
                                                    >
                                                        Next
                                                    </button>
                                                </li>
                                            </ul>
                                         </nav>
                                          <div className="row-per-page d-flex gap-2 ms-3" style={{ lineHeight: "28px", marginTop: "-20px", paddingTop: "0" }}>
                                             <span className="text-muted" style={{ fontSize: "12px", display: "flex", alignItems: "center", height: "28px" }}>Rows per page</span>
                                             <select
                                                 className="form-select form-select-sm"
                                                 style={{ width: "auto", minWidth: "80px", height: "28px", padding: "2px 8px", lineHeight: "24px" }}
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
                                )}
                            </div>
                        )}
                    </div>
                </div>
            </div>
        </div>
    );
};

export default DoctorProfileList;


