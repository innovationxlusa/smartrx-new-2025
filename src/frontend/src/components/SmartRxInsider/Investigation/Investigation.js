import { useState, useEffect } from "react";
import "./Investigation.css";
import CustomAccordion from "../../static/CustomAccordion/CustomAccordion";
import { ReactComponent as GearIcon } from "../../../assets/img/GearIcon.svg";
import { ReactComponent as LocationIcon } from "../../../assets/img/LocationIcon.svg";
import { ReactComponent as ClockIcon } from "../../../assets/img/ClockIcon.svg";
import { ReactComponent as PhoneIcon } from "../../../assets/img/PhoneIcon.svg";
import IbnSinaIcon from "../../../assets/img/IbnSinaIcon.svg";
import NationalIcon from "../../../assets/img/NationalIcon.svg";
import DiagnosticIcon from "../../../assets/img/diagnnosticCenters.svg";
import InvestigationIcon from "../../../assets/img/InvestigationIcon.svg";
import DhakaMedicalIcon from "../../../assets/img/dhakaMedical.png";
import LabaidIcon from "../../../assets/img/labaid.png";
import PopularIcon from "../../../assets/img/PopulaR.jpeg";
import CustomButton from "../../static/Commons/CustomButton";
import InvestigateManagementModal from "./InvestigateManagementModal";
import { useFetchData } from "../../../hooks/useFetchData.js";
import useApiClients from "../../../services/useApiClients.js";
import AddEditTestCenterModal from "./AddEditTestCenterModal";
import { useUserContext } from "../../../contexts/UserContext.js";
import DiagnosticCenter from "../../../assets/img/DiagnosticCenter.png";
import ReadMoreCard from "../../static/ReadMoreCard.js";


const Investigation = ({
    smartRxInsiderData,
    description,
    smartRxInsiderDataRefetch,
}) => {
    /*  ───── Local state ─────  */
    const [modalType, setModalType] = useState(null);
    const [currentPage, setCurrentPage] = useState(1);
    const [sortBy, setSortBy] = useState("name");
    const [sortDirection, setSortDirection] = useState("asc");
    const [itemsPerPage, setItemsPerPage] = useState(20);
    const [testCenterName, setTestCenterName] = useState(null);
    const [isRecommended, setIsRecommended] = useState(true);
    const [debouncedTestCenterName, setDebouncedTestCenterName] = useState("");
    const [selectedInvestigationId, setSelectedInvestigationId] = useState(null);
    const sourceTestIds = [];
    const sourceTestIdSet = new Set();
    const { api } = useApiClients();

    const getSortField = (sortBy) => {
        if (sortBy === "lowToHigh" || sortBy === "highToLow") return "rating";
        if (sortBy === "yearAsc" || sortBy === "yearDesc")
            return "yearofestablishment";
        if (sortBy === "alphabeticAsc" || sortBy === "alphabeticDesc")
            return "name";
        return "name";
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

    const { user } = useUserContext();

    useEffect(() => {
        const timer = setTimeout(() => {
            setTestCenterName(debouncedTestCenterName);
            setCurrentPage(1);
        }, 300);

        return () => clearTimeout(timer);
    }, [debouncedTestCenterName]);

    const investigations = smartRxInsiderData?.prescriptions?.[0]?.investigations || [];


    const grouped = investigations.reduce((acc, test) => {
        const id = test.testCenterId;
        if (!acc[id]) acc[id] = { center: test, tests: [] };
        acc[id].tests.push(test);

        if (!sourceTestIdSet.has(test.testId)) {
            sourceTestIdSet.add(test.testId);
            sourceTestIds.push(test.testId);
        }
        return acc;
    }, {});

    const renderStars = (rating) => {
        const safeRating = Math.max(0, Math.min(5, parseFloat(rating) || 0)); // Clamp between 0–5
        const full = Math.floor(safeRating);
        const hasHalf = safeRating % 1 >= 0.25 && safeRating % 1 < 0.75;
        const empty = Math.max(0, 5 - full - (hasHalf ? 1 : 0)); // Avoid negative repeat

        return (
            <>
                {"★".repeat(full)}
                {hasHalf && "☆"} {/* or use half-star icon if needed */}
                {"☆".repeat(empty)}
            </>
        );
    };

    /* ───────── Modal helpers ───────── */
    const openModal = (type) => setModalType(type);
    const closeModal = () => setModalType(null);

    const handleOpenModal = (
        sourceTestIds,
        type,
        testCenterName,
        isRecommended
    ) => {
        openModal(type);
    };

    const {
        data: testCenterListToCompareData = {},
        isLoading,
        error,
        refetch,
    } = useFetchData(
        modalType === "compare" ? api.getTestCenterListToCompare : null,
        modalType === "compare" && sourceTestIds ? currentPage - 1 : null,
        modalType === "compare" && sourceTestIds ? itemsPerPage : null,
        modalType === "compare" && sourceTestIds ? "name" : null,
        modalType === "compare" && sourceTestIds
            ? getSortDirection(sortBy)
            : null,
        modalType === "compare" && sourceTestIds
            ? {
                SmartRxMasterId: smartRxInsiderData?.smartRxId,
                PrescriptionId: smartRxInsiderData?.prescriptions?.[0]?.prescriptionId,
                IsRecommended: isRecommended,
                TestCenterName: testCenterName,
                SourceTestIds: sourceTestIds,
                PagingSorting: {
                    PageNumber: currentPage,
                    PageSize: itemsPerPage,
                    SortBy: getSortField(sortBy),
                    SortDirection: getSortDirection(sortDirection),
                },
            }
            : null,
        modalType === "compare" && sourceTestIds ? testCenterName : null
    );

    const {
        data: doctorRecommendedTestListData = {},
        isLoading: isDoctorRecommendedTestListLoading,
        error: doctorRecommendedTestListError,
    } = useFetchData(
        modalType === "add" || modalType === "compare"
            ? api.getDoctorRecommendedTestList
            : null,
        (modalType === "add" || modalType === "compare") && sourceTestIds
            ? currentPage - 1
            : null,
        (modalType === "add" || modalType === "compare") && sourceTestIds
            ? itemsPerPage
            : null,
        (modalType === "add" || modalType === "compare") && sourceTestIds
            ? "name"
            : null,
        (modalType === "add" || modalType === "compare") && sourceTestIds
            ? getSortDirection(sortBy)
            : null,
        (modalType === "add" || modalType === "compare") && sourceTestIds
            ? {
                TestCenterName: testCenterName,
                DoctorsTestList: sourceTestIds,
                SmartrxId: smartRxInsiderData?.smartRxId,
                PrescriptionId:
                    smartRxInsiderData?.prescriptions?.[0]?.prescriptionId,
                PagingAndSorting: {
                    PageNumber: 1,
                    PageSize: 20,
                    SortBy: "rating",
                    SortDirection: "asc",
                },
                IsDoctorRecommended:
                    smartRxInsiderData?.prescriptions?.[0]?.isRecommended,
            }
            : null,
        (modalType === "add" || modalType === "compare") && sourceTestIds
            ? testCenterName
            : null
    );

    const {
        data: testCenterListData = [],
        isLoading: isTestCenterListLoading,
        error: testCenterListError,
    } = useFetchData(
        modalType === "add" ? api.getInvestigationTestCenterList : null, // api.getInvestigationTestCenterList
        modalType === "add" ? 0 : null, // page
        modalType === "add" ? 0 : null, // rowsPerPage
        modalType === "add" ? null : null, // sortField
        modalType === "add" ? null : null, // sortOrder
        modalType === "add" ? { UserId: Number(user?.jti) } : null // custom param for payload
    );

    const {
        data: investigationFAQsData,
        isLoading: isInvestigationFAQLoading,
        error: investigationFAQError,
        refetch: faqRefetch,
    } = useFetchData(
        modalType === "test information"
            ? api.getSmartRxInsiderInvestigationFAQByTestId
            : null,
        modalType === "test information" && selectedInvestigationId ? 0 : null,
        modalType === "test information" && selectedInvestigationId ? 0 : null,
        null,
        null,
        modalType === "test information" ? selectedInvestigationId : null
    );

    return (
        <div className="investigation-wrapper">
            <div className="investigation-diagnostic-header">
                <div className="investigation-header-content">
                    <div className="investigation-header-title d-flex align-items-center mt-3 mb-0">
                        <img
                            src={DiagnosticIcon}
                            alt="Diagnostic Icon"
                            className="investigation-diagnostic-icon"
                        />
                        <h3 className="investigation-title-text mb-0">
                            <b>Diagnostic Centers</b>
                        </h3>
                    </div>

                    <div className="d-flex justify-content-center mt-4 mb-3">
                        <CustomButton
                            type="button"
                            label="Add / Edit Test Center"
                            className="investigation-action-btn mt-2"
                            width="clamp(250px, 30vw, 450px)"
                            height="clamp(42px, 2.3vw, 40px)"
                            textColor="var(--theme-font-color)"
                            backgroundColor="#FAF8FA"
                            borderRadius="3px"
                            shape="Square"
                            borderColor="1px solid var(--theme-font-color)"
                            labelStyle={{
                                fontSize: "clamp(14px, 2vw, 16px)",
                                fontWeight: "100",
                                textTransform: "capitalize",
                            }}
                            hoverEffect="theme"
                            onClick={(e) => {
                                e.stopPropagation();
                                e.nativeEvent.stopImmediatePropagation();

                                handleOpenModal(null, "add", null);
                            }}
                        />
                    </div>
                </div>
            </div>

            {Object.values(grouped).map(({ center, tests }, idx) => {
                const testCenters = Array.isArray(center.testCenters)
                    ? center.testCenters
                    : [];

                if (testCenters.length === 0) return null;

                const allCenters = tests.flatMap(
                    (test) => test.testCenters || []
                );
                const uniqueCentersMap = {};
                allCenters.forEach((tc) => {
                    if (tc && tc.name && !uniqueCentersMap[tc.name]) {
                        uniqueCentersMap[tc.name] = tc;
                    }
                });
                const uniqueTestCenters = Object.values(uniqueCentersMap);
                const isDoctorRecommended = tests.some(
                    (test) => test.isDoctorRecommended
                );

                return (
                    <div key={`group-${idx}`}>
                        <div className="text-muted mb-2 mt-2">
                            <span
                                className="badge"
                                style={{
                                    backgroundColor: "#FAF8FA",
                                    color: "var(--theme-font-color)",
                                    fontWeight: "800",
                                    fontSize: "14px",
                                }}
                            >
                                {isDoctorRecommended
                                    ? "Recommended by the doctor"
                                    : "Selected by the user"}
                            </span>
                        </div>

                        {uniqueTestCenters.map((testCenter, tcIdx) => {
                            const matchedTestsCount = tests.filter(
                                (test) =>
                                    Array.isArray(test.testCenters) &&
                                    test.testCenters.some(
                                        (tc) => tc.name === testCenter.name
                                    )
                            ).length;

                            return (
                                <CustomAccordion
                                    key={`${testCenter.name}-${tcIdx}`}
                                    background="#ffffff"
                                    border="1px solid #D9D9D9"
                                    borderRadius="4px"
                                    className="custom-accordion-inv mt-0 investigation-test-center-body"
                                    isInvestigation={true}
                                    shadow={false}
                                    defaultOpen={false}
                                    accordionArrowIconClass="me-0"
                                    accordionHeaderData={
                                        <div className="pt-4 pb-4">
                                            {/* <div className="d-flex justify-content-between align-items-start"> */}
                                            <div className="d-flex gap-1 align-items-start">
                                                <div
                                                    className={testCenter.diagnosticCenterIcon ? "fs-1 me-2 pe-1" : ""}
                                                    style={{
                                                        height: "20px",
                                                    }}
                                                >
                                                    <img
                                                        src={
                                                            testCenter.diagnosticCenterIcon ||
                                                            DiagnosticCenter
                                                        }
                                                        alt={
                                                            center.diagnosticTestCenterName
                                                        }
                                                        className={
                                                            testCenter.diagnosticCenterIcon
                                                                ? "investigation-center-icon"
                                                                : "investigation-center-icon-2"
                                                        }
                                                    />
                                                </div>
                                                <div className="w-100">
                                                    <div className="investigation-card-header d-flex align-items-start justify-content-between w-100">
                                                        <div>{testCenter.name}</div>
                                                        {/* Right side */}
                                                        <div className="d-flex justify-content-end align-items-center mt-0">
                                                            <a
                                                                href="https://www.google.com/"
                                                                target="_blank"
                                                                rel="noopener noreferrer"
                                                                className="investigation-card-header-2 text-nowrap change-center"
                                                                style={{
                                                                    color: "blue",
                                                                    textDecoration: "underline",
                                                                    cursor: "pointer",
                                                                }}
                                                                onClick={(e) =>
                                                                    e.stopPropagation()
                                                                }
                                                            >
                                                                Change Center
                                                            </a>
                                                        </div>
                                                    </div>
                                                    <div className="investigation-center-branch">
                                                        {testCenter.branch ?? ""}
                                                    </div>
                                                    <div>
                                                        <p className="investigation-center-address">{testCenter.address}</p>
                                                        <div className="investigation-rating d-flex align-items-center gap-1">
                                                            <span>{testCenter.googleRating}</span>
                                                            <span className="investigation-rating-display">
                                                                {renderStars(
                                                                    parseFloat(
                                                                        testCenter.googleRating
                                                                    )
                                                                )}
                                                            </span>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            {/* </div> */}

                                            <p className="investigation-test-summary ms-4 ps-2">
                                                {matchedTestsCount} out of{" "}
                                                {tests.length} tests under this
                                                – Click to change
                                            </p>
                                        </div>
                                    }
                                >
                                    <div className="accordion-content investigation-test-center-body">
                                        <div className="investigation-info-line">
                                            <LocationIcon className="me-2" />
                                            {testCenter.address}
                                        </div>
                                        <div className="investigation-info-line warning">
                                            <ClockIcon className="me-2" /> {testCenter.closeTime ? ` Close
                                            Soon -  ${testCenter.closeTime}` : ""}
                                            {testCenter.openDay === "Everyday" ? `- Open everyday` :
                                                <>
                                                    {testCenter.openTime ? `- Open -  ${testCenter.openTime}` : ""}

                                                    {testCenter.openDay}
                                                </>
                                            }

                                        </div>
                                        <div className="investigation-info-line">
                                            <PhoneIcon className="me-2" />
                                            {testCenter.phone}
                                        </div>
                                    </div>
                                </CustomAccordion>
                            );
                        })}
                    </div>
                );
            })}

            <div className="investigation-tests-header mt-4">
                <div className="investigation-header-content pb-4">
                    <div className="investigation-header-title d-flex align-items-center mt-3 mb-0">
                        <img
                            src={InvestigationIcon}
                            alt="Diagnostic Icon"
                            className="investigation-diagnostic-icon"
                        />
                        <h3 className="investigation-title-text mb-0">
                            <b>Tests</b>
                        </h3>
                    </div>
                </div>
            </div>
            <div className="">
                {Object.values(grouped).map(({ center, tests }) =>
                    tests.map((test, i) => {
                        const testCenter =
                            Array.isArray(test.testCenters) &&
                                test.testCenters.length > 0
                                ? test.testCenters[0]
                                : null;

                        return (
                            <CustomAccordion
                                key={i}
                                background="#ffffff"
                                border="1px solid #D9D9D9"
                                borderRadius="4px"
                                isInvestigation={true}
                                shadow={false}
                                defaultOpen={false}
                                accordionArrowIconClass="me-0"
                                setSelectedInvestigationId={
                                    setSelectedInvestigationId
                                }
                                accordionHeaderData={
                                    <div>
                                        <div className="d-flex justify-content-between align-items-start p-0 mb-3">
                                            <div className="d-flex justify-content-between align-items-start align-items-md-baseline">
                                                <div>
                                                    <div className="investigation-card-header">
                                                        {test.testName}
                                                    </div>
                                                    <div>
                                                        <ReadMoreCard className="investigation-read-more" description={test.testDescription} />
                                                    </div>
                                                </div>
                                            </div>

                                            {/* Right side */}
                                            <div className="d-flex justify-content-end align-items-center mt-0 mt-md-1">
                                                <a
                                                    href="https://www.google.com/"
                                                    target="_blank"
                                                    rel="noopener noreferrer"
                                                    className="investigation-card-header-2 text-nowrap change-center"
                                                    style={{
                                                        color: "blue",
                                                        textDecoration:
                                                            "underline",
                                                        cursor: "pointer",
                                                    }}
                                                    onClick={(e) =>
                                                        e.stopPropagation()
                                                    }
                                                >
                                                    Change Center
                                                </a>
                                            </div>
                                        </div>
                                    </div>
                                }
                            >
                                <div className="accordion-content investigation-test-center-body">
                                    {test.testCenters &&
                                        test.testCenters.length > 0 ? (
                                        <>
                                            {test.testCenters.map(
                                                (center, index) => (
                                                    <div key={index} className="investigation-info-line">
                                                        <img src={testCenter.diagnosticCenterIcon || DiagnosticCenter} alt={center.diagnosticTestCenterName} className="investigation-center-icon" />
                                                        {center.name ?? "No Center "} | BDT {test.testUnitPrice}
                                                    </div>
                                                ),
                                            )}
                                            <div className="investigation-info-line">
                                                <img src={NationalIcon} alt="National" className="me-2" />
                                                National Price | BDT  {test.testNationalUnitPrice}
                                                <br />
                                                Source: {test.testNationalUnitPriceSource || "N/A"}
                                            </div>
                                        </>
                                    ) : (
                                        <div className="investigation-info-line">
                                            No Test Centers
                                        </div>
                                    )}
                                </div>

                                <div className="d-flex justify-content-center mt-1 mb-2">
                                    <CustomButton
                                        type="button"
                                        label="Test Information"
                                        className="investigation-action-btn mt-2"
                                        width="clamp(250px, 30vw, 450px)"
                                        height="clamp(42px, 2.3vw, 40px)"
                                        textColor="var(--theme-font-color)"
                                        backgroundColor="#FAF8FA"
                                        borderRadius="3px"
                                        shape="Square"
                                        borderColor="1px solid var(--theme-font-color)"
                                        labelStyle={{
                                            fontSize: "clamp(14px, 2vw, 16px)",
                                            fontWeight: "100",
                                            textTransform: "capitalize",
                                        }}
                                        hoverEffect="theme"
                                        onClick={(e) => {
                                            e.stopPropagation();
                                            e.nativeEvent.stopImmediatePropagation();
                                            setSelectedInvestigationId(
                                                test.testId,
                                            );
                                            handleOpenModal(
                                                sourceTestIds,
                                                "test information",
                                                testCenterName,
                                                selectedInvestigationId,
                                            );
                                        }}
                                    />
                                </div>
                            </CustomAccordion>
                        );
                    })
                )}

                <div className="investigation-total-price">
                    <div>Test Total Price</div>
                    <strong>
                        | BDT{" "}
                        {Object.values(grouped)
                            ?.reduce(
                                (total, g) =>
                                    total +
                                    g.tests.reduce(
                                        (sum, t) =>
                                            sum + (t.testUnitPrice || 0),
                                        0
                                    ),
                                0
                            )
                            .toFixed(2)}
                    </strong>
                </div>
                <div className="d-flex justify-content-center mt-4 ">
                    <CustomButton
                        type="button"
                        label="Compare Test Center"
                        width="clamp(250px, 30vw, 450px)"
                        height="clamp(42px, 2.3vw, 40px)"
                        textColor="var(--theme-font-color)"
                        backgroundColor="#FAF8FA"
                        borderRadius="3px"
                        shape="Square"
                        borderColor="1px solid var(--theme-font-color)"
                        labelStyle={{
                            fontSize: "clamp(14px, 2vw, 16px)",
                            fontWeight: "100",
                            textTransform: "capitalize",
                        }}
                        hoverEffect="theme"
                        onClick={(e) => {
                            e.stopPropagation();
                            e.nativeEvent.stopImmediatePropagation();
                            handleOpenModal(
                                sourceTestIds,
                                "compare",
                                testCenterName,
                                isRecommended
                            );
                        }}
                    />
                </div>
                {/* <div className="d-flex justify-content-center mt-1 mb-2">
          <CustomButton
            type="button"
            label="Test Information"
            className="investigation-action-btn mt-2"
            width="clamp(250px, 30vw, 450px)"
            height="clamp(42px, 2.3vw, 40px)"
            textColor="var(--theme-font-color)"
            backgroundColor="#FAF8FA"
            borderRadius="3px"
            shape="Square"
            borderColor="1px solid var(--theme-font-color)"
            labelStyle={{
              fontSize: "clamp(14px, 2vw, 16px)",
              fontWeight: "100",
              textTransform: "capitalize",
            }}
            hoverEffect="theme"
            onClick={(e) => {
              e.stopPropagation();
              e.nativeEvent.stopImmediatePropagation();
              setSelectedInvestigationId(test.testId);
              handleOpenModal(
                sourceTestIds,
                "test information",
                testCenterName,
                selectedInvestigationId
              );
            }}
          />
        </div> */}
            </div>
            {/* ───── Add / Edit / Delete modal ───── */}
            <InvestigateManagementModal
                isOpen={
                    modalType === "test information" || modalType === "compare"
                }
                modalType={modalType}
                onClose={closeModal}
                data={
                    modalType === "test information"
                        ? investigationFAQsData
                        : modalType === "compare"
                            ? testCenterListToCompareData
                            : null
                }
                selectedInvestigationId={selectedInvestigationId}
                sourceTestIds={sourceTestIds}
                isLoading={
                    modalType === "test information"
                        ? isInvestigationFAQLoading
                        : isLoading
                }
                error={
                    modalType === "test information"
                        ? investigationFAQError
                        : error
                }
                currentPage={currentPage}
                setCurrentPage={setCurrentPage}
                itemsPerPage={itemsPerPage}
                setItemsPerPage={setItemsPerPage}
                sortBy={sortBy}
                setSortBy={setSortBy}
                sortDirection={sortDirection}
                setSortDirection={setSortDirection}
                testCenterName={testCenterName}
                setTestCenterName={setDebouncedTestCenterName}
                doctorRecommendedTestListData={
                    doctorRecommendedTestListData.selectedOrRecommendedTestList
                }
                smartRxInsiderData={smartRxInsiderData}
                testCenterListRefetch={refetch}
                isDoctorRecommendedTestListLoading={
                    isDoctorRecommendedTestListLoading
                }
            />
            <AddEditTestCenterModal
                SmartRxMasterId={smartRxInsiderData.smartRxId}
                PrescriptionId={
                    smartRxInsiderData?.prescriptions?.[0].prescriptionId
                }
                LoginUserId={smartRxInsiderData.userId}
                isOpen={modalType === "add"}
                modalType={modalType}
                onClose={closeModal}
                smartRxInsiderDataRefetch={smartRxInsiderDataRefetch}
                testCenterAndTestListData={testCenterListData}
                doctorRecommendedTestListData={
                    doctorRecommendedTestListData.selectedOrRecommendedTestList
                }
                doctorRecommendedTestCenterAndTestListData={Object.values(
                    grouped
                )}
            />
        </div>
    );
};

export default Investigation;
