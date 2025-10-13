import "./Medicine.css";
import { useState } from "react";
import ReadMoreCard from "../../static/ReadMoreCard.js";
import FaTablets from "../../../assets/img/tablet.svg";
import skfLogo from "../../../assets/img/skfLogo.png";
import noonIcon from "../../../assets/img/summer.png";
import nightIcon from "../../../assets/img/night.png";
import eveningIcon from "../../../assets/img/eveIcon.svg";
import morningIcon from "../../../assets/img/clearSky.png";
import RiCapsuleFill from "../../../assets/img/capsule.svg";
import TbMedicineSyrup from "../../../assets/img/syrup.svg";
import squareLogo from "../../../assets/img/squareLogo.png";
import beximcoLogo from "../../../assets/img/beximcoLogo.png";
import inceptaLogo from "../../../assets/img/inceptaLogo.png";
import { useFetchData } from "../../../hooks/useFetchData.js";
import useApiClients from "../../../services/useApiClients.js";
import warningIcon from "../../../assets/img/RxWarningIcon.svg";
import { HiMiniArrowTopRightOnSquare } from "react-icons/hi2";
import MedicineManagementModal from "./MedicineManagementModal.js";
import { ReactComponent as Check } from "../../../assets/img/Check.svg";
import CustomAccordion from "../../static/CustomAccordion/CustomAccordion.js";
import { FaEdit, FaTrash, FaCopy } from "react-icons/fa";

const Medicine = ({ smartRxInsiderData }) => {
    /*  ───── Local state ─────  */
    const [modalType, setModalType] = useState(null);
    const [selectedMedicineId, setSelectedMedicineId] = useState(null);
    const [currentPage, setCurrentPage] = useState(1);
    const [sortBy, setSortBy] = useState("lowToHigh");
    const [itemsPerPage, setItemsPerPage] = useState(3);
    const [totalDosageQty, setTotalDosageQty] = useState("");

    const { api } = useApiClients();

    // For Comparison Modal (when modalType is "add")
    const getSortField = (sortBy) => {
        if (sortBy === "lowToHigh" || sortBy === "highToLow") return "price";
        if (sortBy === "alphabeticAsc" || sortBy === "alphabeticDesc")
            return "name";
        return "price"; // fallback
    };

    const getSortDirection = (sortBy) => {
        if (sortBy === "lowToHigh" || sortBy === "alphabeticAsc") return "asc";
        if (sortBy === "highToLow" || sortBy === "alphabeticDesc")
            return "desc";
        return "asc"; // fallback
    };

    /* ---------- server fetch ---------- */
    const {
        data: medicineListToCompareData = {},
        isLoading,
        error,
        refetch: medicineCompareRefetch,
    } = useFetchData(
        modalType === "add" ? api.getMedicineListToCompare : null,
        modalType === "add" && selectedMedicineId ? currentPage - 1 : null,
        modalType === "add" && selectedMedicineId ? itemsPerPage : null,
        modalType === "add" && selectedMedicineId ? "unitPriceValue" : null,
        modalType === "add" && selectedMedicineId
            ? getSortDirection(sortBy)
            : null,
        modalType === "add" && selectedMedicineId
            ? {
                MedicineId: selectedMedicineId,
                PagingSorting: {
                    PageNumber: currentPage,
                    PageSize: itemsPerPage,
                    SortBy: getSortField(sortBy),
                    SortDirection: getSortDirection(sortBy),
                },
            }
            : null
    );

    /* For FAQ Modal (when modalType is "dragInfo") */
    const {
        data: faqData,
        isLoading: isFaqLoading,
        error: faqError,
        refetch,
    } = useFetchData(
        modalType === "dragInfo"
            ? api.getSmartRxInsiderMedicineFAQByMedicineId
            : null,
        modalType === "dragInfo" && selectedMedicineId ? 0 : null,
        modalType === "dragInfo" && selectedMedicineId ? 0 : null,
        null,
        null,
        modalType === "dragInfo" ? selectedMedicineId : null
    );

    const medicineIcon = {
        tablet: <img src={FaTablets} className="medicine-icon" />,
        capsule: <img src={RiCapsuleFill} className="medicine-icon" />,
        syrup: <img src={TbMedicineSyrup} className="medicine-icon" />,
    }

    const getLogoForCompany = (company) => {
        const lower = company.toLowerCase();
        if (lower.includes("square"))
            return (
                <img src={squareLogo} alt="square" className="company-logo" />
            );
        if (lower.includes("beximco"))
            return (
                <img src={beximcoLogo} alt="beximco" className="company-logo" />
            );
        if (lower.includes("eskayef") || lower.includes("skf"))
            return <img src={skfLogo} alt="skf" className="company-logo" />;
        if (lower.includes("incepta"))
            return <img src={inceptaLogo} alt="inc" className="company-logo" />;
        return null;
    };

    const getTimeIcon = (time) => {
        switch (time.toLowerCase()) {
            case "morning":
                return (
                    <img
                        src={morningIcon}
                        alt="morning"
                        className="time-icon"
                    />
                );
            case "noon":
                return <img src={noonIcon} alt="noon" className="time-icon" />;
            case "evening":
                return (
                    <img
                        src={eveningIcon}
                        alt="evening"
                        className="time-icon"
                    />
                );
            case "night":
                return (
                    <img src={nightIcon} alt="night" className="time-icon" />
                );
            default:
                return null;
        }
    };

    const getDoseString = (entry) => {
        const doses = [];
        for (let i = 1; i <= entry.frequencyInADay; i++) {
            const dose = entry[`dose${i}InADay`];
            doses.push(dose || "0");
        }
        return doses.join("+");
    };


    const getTimeSlots = (frequencyInADay) => {
        switch (frequencyInADay) {
            case 1:
                return ["Morning"];
            case 2:
                return ["Morning", "Night"];
            case 3:
                return ["Morning", "Noon", "Night"];
            case 4:
            default:
                return ["Morning", "Noon", "Evening", "Night"];
        }
    };

    const parseDosage = (dosageString, frequencyInADay) => {
        const slotOrder = getTimeSlots(frequencyInADay);
        const parts = dosageString.split("+").map((part) => part.trim());

        const result = {};
        for (let i = 0; i < slotOrder.length; i++) {
            const key = slotOrder[i].toLowerCase();
            result[key] = parts[i] === "0" ? "No Dosage" : "01 Dosage";
        }
        return result;
    };

    const buildDosageSchedule = (dosage, instruction, frequencyInADay) => {
        const timeSlots = getTimeSlots(frequencyInADay);
        return timeSlots.map((time) => {
            const key = time.toLowerCase();
            return {
                time,
                dosage: dosage[key] || "No Dosage",
                instruction:
                    dosage[key] === "No Dosage"
                        ? "No Instruction Given"
                        : instruction,
            };
        });
    };

    const calculateTotalQty = (day, dosage) => {
        const dosesPerDay = dosage
            ?.split("+")
            .reduce((sum, val) => sum + parseInt(val || "0"), 0);
        return parseInt(day) * dosesPerDay;
    };

    /* ───────── Modal helpers ───────── */
    const openModal = (type) => setModalType(type);
    const closeModal = () => {
        setModalType(null);
        setSelectedMedicineId(null);
    };

    const handleOpenModal = (medicineId, type, dosageQty) => {
        setSelectedMedicineId(medicineId);
        openModal(type);

        setTotalDosageQty(dosageQty);
    };

    return (
        <div className="medicine-container">
            {smartRxInsiderData?.prescriptions?.[0]?.medicines?.map(
                (entry, index) => {
                    const doseStr = getDoseString(entry);
                    const dosage = parseDosage(doseStr, entry.frequencyInADay);
                    const instruction = entry?.notes || "No Instruction Given";
                    const dosageSchedule = buildDosageSchedule(
                        dosage,
                        instruction,
                        entry.frequencyInADay
                    );

                    return (
                        <div key={index} className="">
                            <CustomAccordion
                                className="mt-0"
                                background="#ffffff"
                                border="1px solid #D9D9D9"
                                borderRadius="4px"
                                shadow={false}
                                defaultOpen={false}
                                iconStyleOverride={{
                                    marginRight: "20px",
                                    marginTop: "-8px",
                                }}
                                accordionHeaderData={
                                    <div className="card-header">
                                        <div className="">
                                            <div className="d-flex justify-content-between align-items-center gap-2">
                                                <div>
                                                    <span>{medicineIcon[entry.medicineDosageFormName?.toLowerCase()]}</span>
                                                    <span className="card-header ms-2">{`${entry.medicineDosageFormName} ${entry.medicineName}`}</span>
                                                </div>
                                                <div className="card-header-side">
                                                    {entry.medicineStrength}
                                                </div>
                                            </div>
                                            <div className="card-header-sub d-flex gap-3 gap-md-4 ms-4 ps-1 ps-md-2">
                                                <span>
                                                    {`Days - ${entry.durationOfContinuationCount} `}
                                                </span>
                                                <span>
                                                    Dosage - {doseStr}
                                                </span>
                                            </div>
                                        </div>
                                    </div>
                                }
                            >
                                <div className="accordion-body-content">
                                    <div className="des-title">
                                        {entry.medicineName}
                                    </div>
                                    <ReadMoreCard id="" description={entry.description} />
                                    <div>
                                        <div className="des-company-wrapper">
                                            {getLogoForCompany(
                                                entry.medicineManufacturerName,
                                            )}
                                            <div className="des-company">{entry.medicineManufacturerName}</div>

                                            {/* medicineManufacturerUrl */}
                                            <div className="des-icon ms-1">
                                                {entry.medicineManufacturerUrl ? (
                                                    <a
                                                        href={
                                                            entry.medicineManufacturerUrl
                                                        }
                                                        target="_blank"
                                                        rel="noopener noreferrer"
                                                        className="text-decoration-none"
                                                    >
                                                        <HiMiniArrowTopRightOnSquare />
                                                    </a>
                                                ) : (
                                                    <HiMiniArrowTopRightOnSquare
                                                        style={{ opacity: 0.4 }}
                                                    />
                                                )}
                                            </div>
                                        </div>

                                        <div className="des-warning-wrapper">
                                            <img
                                                src={warningIcon}
                                                alt="warning"
                                                className="warning-logo"
                                            />
                                            <div className="des-warning">
                                                {
                                                    entry.medicinePrecautionsAndWarnings
                                                }
                                            </div>
                                        </div>

                                        <div className="dosage-schedule">
                                            <div className="timeline">
                                                {dosageSchedule.map(
                                                    (schedule, idx) => (
                                                        <div
                                                            key={idx}
                                                            className="timeline-item"
                                                        >
                                                            <div
                                                                className={`timeline-bullet bullet-${schedule.time.toLowerCase()}`}
                                                            />
                                                            <div className="timeline-content">
                                                                <div className="time-header">
                                                                    <div className="time-text">
                                                                        <span>
                                                                            {
                                                                                schedule.time
                                                                            }{" "}
                                                                            -{" "}
                                                                        </span>
                                                                        <span className="dosage-text">
                                                                            {
                                                                                schedule.dosage
                                                                            }
                                                                        </span>
                                                                    </div>
                                                                    <div className="time-icon">
                                                                        {getTimeIcon(
                                                                            schedule.time,
                                                                        )}
                                                                    </div>
                                                                </div>
                                                                <div className="instruction-text">
                                                                    {
                                                                        schedule.instruction
                                                                    }
                                                                </div>
                                                            </div>
                                                        </div>
                                                    ),
                                                )}
                                            </div>
                                        </div>

                                        <div className="price-box-main">
                                            <div className="price-box">
                                                <div className="price-header-container">
                                                    <div className="price-header-text">
                                                        Total Cost BDT
                                                    </div>
                                                    <div className="total-cost-corner">
                                                        <span className="arc-value">
                                                            {(
                                                                Number(
                                                                    entry.medicineUnitPrice,
                                                                ) *
                                                                calculateTotalQty(
                                                                    entry.durationOfContinuationCount,
                                                                    doseStr,
                                                                )
                                                            ).toFixed(2)}
                                                        </span>
                                                    </div>
                                                </div>
                                                <div className="price-below-part">
                                                    <div className="price-row-fix">
                                                        <div className="price-row row-unit-price">
                                                            <span>
                                                                <Check />
                                                            </span>
                                                            <span className="price-label">
                                                                Unit Price
                                                            </span>
                                                            <span className="price-divider">
                                                                --
                                                            </span>
                                                            <span className="price-value">
                                                                BDT{" "}
                                                                {Number(
                                                                    entry.medicineUnitPrice,
                                                                ).toFixed(2)}
                                                            </span>
                                                        </div>
                                                        <div className="price-row row-total-qty">
                                                            <span>
                                                                <Check />
                                                            </span>
                                                            <span className="price-label">
                                                                Total Qty
                                                            </span>
                                                            <span className="price-divider">
                                                                --
                                                            </span>
                                                            <span className="price-value">
                                                                {calculateTotalQty(
                                                                    entry.durationOfContinuationCount,
                                                                    doseStr,
                                                                )}{" "}
                                                                Pieces
                                                            </span>
                                                        </div>
                                                    </div>
                                                    <div className="text-compare">
                                                        <button
                                                            className="add-button"
                                                            onClick={(e) => {
                                                                e.stopPropagation();
                                                                e.nativeEvent.stopImmediatePropagation();
                                                                handleOpenModal(
                                                                    entry.medicineId,
                                                                    "add",
                                                                    calculateTotalQty(
                                                                        entry.durationOfContinuationCount,
                                                                        doseStr,
                                                                    ),
                                                                );
                                                            }}
                                                        >
                                                            Compare Drug
                                                        </button>
                                                    </div>
                                                    <div className="text-drug">
                                                        <button
                                                            className="add-button"
                                                            onClick={(e) => {
                                                                e.stopPropagation();
                                                                e.nativeEvent.stopImmediatePropagation();
                                                                handleOpenModal(
                                                                    entry.medicineId,
                                                                    "dragInfo",
                                                                    "",
                                                                );
                                                            }}
                                                        >
                                                            Drug Information
                                                        </button>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </CustomAccordion>
                        </div>
                    );
                }
            )}

            {/* ───── Add / Edit / Delete modal ───── */}
            <MedicineManagementModal
                isOpen={!!modalType}
                modalType={modalType}
                onClose={closeModal}
                selectedMedicineId={selectedMedicineId}
                data={modalType === "add" ? medicineListToCompareData : faqData}
                isLoading={modalType === "add" ? isLoading : isFaqLoading}
                error={modalType === "add" ? error : faqError}
                currentPage={currentPage}
                setCurrentPage={setCurrentPage}
                sortBy={sortBy}
                setSortBy={setSortBy}
                itemsPerPage={itemsPerPage}
                setItemsPerPage={setItemsPerPage}
                totalDosageQty={totalDosageQty}
                smartRxInsiderData={smartRxInsiderData}
                refetch={medicineCompareRefetch}
            />
        </div>
    );
};

export default Medicine;
