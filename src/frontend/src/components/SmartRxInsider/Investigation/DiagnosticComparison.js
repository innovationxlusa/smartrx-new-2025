import { useState } from "react";
import "./DiagnosticComparison.css";
import ClickableStarRating from "./StarRating";
import { IoMdReturnLeft } from "react-icons/io";
import { FaHeart, FaRegHeart } from "react-icons/fa";
import { ReactComponent as PriceIcon } from "../../../assets/img/PriceIcon.svg";
import { ReactComponent as PlusIconSmall } from "../../../assets/img/PlusIconSmall.svg";
import { ReactComponent as PriceComparison } from "../../../assets/img/PriceComparison.svg";
import useApiClients from "../../../services/useApiClients";
import CustomButton from "../../static/Commons/CustomButton";

const DiagnosticComparison = ({
    smartRxInsiderData,
    selectedDiagnostics = [],
    onReturn,
    testCenterListRefetch,
}) => {
    const [ratings, setRatings] = useState(() =>
        Object.fromEntries(
            selectedDiagnostics.map((center) => [
                center.diagnosticTestCenterId,
                center.diagnosticTestCenterGoogleRating || 0,
            ])
        )
    );

    const [favorite, setFavorite] = useState(() =>
        selectedDiagnostics
            .filter((center) => center.wished)
            .map((center) => center.diagnosticTestCenterId)
    );

    const [isLoading, setIsLoading] = useState(false);

    const { api } = useApiClients();

    const tests = Array.from(
        new Set(
            selectedDiagnostics?.map((t) => t.diagnosticeTestCenterTestFullName)
        )
    );

    const handleRatingChange = (centerId, newRating) => {
        setRatings((prev) => ({
            ...prev,
            [centerId]: newRating,
        }));
    };

    const totalPrice = (centerTests = {}) => {
        return centerTests.reduce((sum, test) => {
            return (
                sum +
                Number(
                    test.testUnitPrice ||
                        test.diagnosticeTestCenterWiseTestUnitPrice ||
                        0
                )
            );
        }, 0);
    };

    const handleAddToWishlist = async (e, center) => {
        e.preventDefault();

        try {
            setIsLoading(true);

            const newData = {
                SmartRxMasterId: smartRxInsiderData?.smartRxId,
                PrescriptionId:
                    smartRxInsiderData?.prescriptions[0].prescriptionId,
                InvestigationId: center?.investigationId,
                WishListIds: center.updatedFavorites || favorite,
                LoginUserId: smartRxInsiderData?.userId,
            };

            const response = await api.updateInvestigationWishList(newData, "");

            if (
                response?.message === "Successful" ||
                typeof response === "object"
            ) {
                testCenterListRefetch && testCenterListRefetch();
                // fetchFolders && fetchFolders();
                // folderRefetch && folderRefetch();
                // onClose();
            }
        } catch (e) {
            console.error(e);
        } finally {
            setIsLoading(false);
        }
    };

    const handleSaveAllWishlist = async (e, center) => {
        try {
            setIsLoading(true);
            const newData = {
                SmartRxMasterId: smartRxInsiderData?.smartRxId,
                PrescriptionId:
                    smartRxInsiderData?.prescriptions[0].prescriptionId,
                InvestigationId: selectedDiagnostics[0]?.investigationId,
                WishListIds: favorite,
                LoginUserId: smartRxInsiderData?.userId,
            };

            const response = await api.updateInvestigationWishList(newData, "");

            if (
                response?.message === "Successful" ||
                typeof response === "object"
            ) {
                console.log("Test center refetch:", testCenterListRefetch);
                console.log("befor testCenterListRefetch" , response);
                if(testCenterListRefetch ===null)
                {
                    
                }
                else
                {
                    console.log("testCenterListRefetch is not null");
                }
                 testCenterListRefetch && testCenterListRefetch();
            }
        } catch (e) {
            console.error(e);
        } finally {
            setIsLoading(false);
        }
    };

    return (
        <div className="diagnostic-comparison-box">
            <h5 className="diagnostic-section-title mb-3">
                <span className="me-2">
                    <PlusIconSmall />
                </span>
                Overall Comparison
            </h5>

            {console.log(selectedDiagnostics)}

            <div className="diagnostic-list">
                {selectedDiagnostics.map((center, index) => (
                    <div
                        key={center.diagnosticTestCenterId}
                        className={`d-flex align-items-center justify-content-between px-1 py-2 ${
                            selectedDiagnostics.length !== index + 1
                                ? " border-bottom"
                                : ""
                        }`}
                    >
                        <div
                            className="diagnostic-item-content d-flex align-items-center gap-2 flex-grow-1"
                            style={{ width: "100%" }}
                        >
                            <div
                                className="flex-grow-1 text-start"
                                style={{
                                    fontSize: "12px",
                                    width: "38%",
                                    whiteSpace: "normal",
                                    wordBreak: "break-word",
                                }}
                            >
                                <strong>
                                    {center.diagnosticTestCenterName}
                                </strong>
                            </div>

                            <div
                                className="align-items-center"
                                style={{ width: "27%" }}
                            >
                                <span className="">
                                    ({center.diagnosticTestCenterGoogleRating})
                                </span>
                                <ClickableStarRating
                                    rating={
                                        ratings[
                                            center.diagnosticTestCenterId
                                        ] || 0
                                    }
                                    onChange={(val) => {
                                        handleRatingChange(
                                            center.diagnosticTestCenterId,
                                            val,
                                        );
                                    }}
                                    precision={0.1}
                                    size={10}
                                    readOnly={true}
                                />
                            </div>

                            <div
                                className="text-muted small text-start"
                                style={{
                                    width: "25%",
                                    whiteSpace: "normal",
                                    wordBreak: "break-word",
                                    overflow: "hidden",
                                }}
                            >
                                {center.diagnosticTestCenterLocation}
                            </div>

                            <div
                                className="text-muted small text-end"
                                style={{ width: "10%" }}
                            >
                                {center.year || 2000}
                            </div>
                        </div>
                    </div>
                ))}
            </div>

            <h5 className="diagnostic-section-title mb-3 mt-4">
                <span role="img" className="me-2">
                    <PriceIcon />
                </span>
                Price Comparison
            </h5>
            {tests.map((testName, index) => (
                <div
                    key={index}
                    className={`d-flex border-bottom ps-2 align-items-center ${
                        index === 0 ? "border-top" : ""
                    }`}
                >
                    <div
                        className="fw-medium text-start"
                        style={{
                            fontSize: "12px",
                            width: "40%",
                            whiteSpace: "normal",
                            wordBreak: "break-word",
                        }}
                    >
                        {testName || "N/A"}
                    </div>

                    <div
                        className="d-flex flex-column diagnostic-test-price-list"
                        style={{
                            width: "60%",
                            whiteSpace: "normal",
                            wordBreak: "break-word",
                        }}
                    >
                        {selectedDiagnostics.map((center) => {
                            return (
                                <div
                                    key={center.diagnosticTestCenterId}
                                    style={{ fontSize: "12px" }}
                                    className="diagnostic-test-price-line d-flex justify-content-between text-muted py-2 px-1 border-bottom align-items-center"
                                >
                                    <div
                                        className="text-truncate text-start"
                                        style={{
                                            fontSize: "12px",
                                            width: "78%",
                                            whiteSpace: "normal",
                                            wordBreak: "break-word",
                                        }}
                                    >
                                        {center.diagnosticTestCenterName}
                                    </div>
                                    <div
                                        className="fw-medium text-end"
                                        style={{
                                            width: "22%",
                                            fontSize: "12px",
                                        }}
                                    >
                                        {center?.testUnitPrice
                                            ? `৳ ${center.testUnitPrice}`
                                            : "--"}
                                    </div>
                                </div>
                            );
                        })}
                    </div>
                </div>
            ))}

            <h5 className="diagnostic-section-title mt-4 mb-2 text-muted">
                <span role="img" className="me-2">
                </span>
                Total Price Comparison
            </h5>

            <div className="d-flex justify-content-between align-items-center border-bottom border-top ps-2">
                <div
                    className="text-muted small text-start"
                    style={{
                        width: "20%",
                    }}
                >
                    All Test
                </div>

                <div
                    style={{
                        width: "80%",
                        whiteSpace: "normal",
                        wordBreak: "break-word",
                        overflow: "hidden",
                    }}
                >
                    {selectedDiagnostics.map((center) => (
                        <div
                            key={center.diagnosticTestCenterId}
                            className={`d-flex justify-content-between align-items-center p-2 ${
                                center.wished ? "bg-success-subtle" : ""
                            }`}
                        >
                            <div
                                className="text-start"
                                style={{ fontSize: "12px", width: "70%" }}
                            >
                                <strong>
                                    {center.diagnosticTestCenterName}
                                </strong>
                            </div>
                            <div
                                className="fw-bold d-flex align-items-center justify-content-between"
                                style={{
                                    width: "30%",
                                }}
                            >
                                <div className="text-start">
                                    ৳ {center.testUnitPrice}
                                </div>
                                <div></div>
                                <div
                                    className="text-end"
                                    // style={{ width: "10%" }}
                                >
                                    <PriceComparison
                                        style={{
                                            color: "#4b3b8b",
                                        }}
                                    />
                                </div>
                            </div>
                        </div>
                    ))}
                </div>
            </div>
            <div className="add-to-wishlist-center gap-3">
                <CustomButton
                    type="button"
                    label="Add to Wishlist"
                    width="clamp(300px, 30vw, 450px)"
                    height="clamp(42px, 2.3vw, 40px)"
                    textColor="var(--theme-font-color)"
                    backgroundColor="#FAF8FA"
                    borderRadius="3px"
                    shape="Square"
                    borderColor="1px solid var(--theme-font-color)"
                    className="action-btn"
                    labelStyle={{
                        fontSize: "clamp(14px, 2vw, 16px)",
                        fontWeight: "100",
                        textTransform: "capitalize",
                    }}
                    hoverEffect="theme"
                    disabled={isLoading || favorite.length === 0}
                    onClick={(e) => {
                        e.stopPropagation();
                        e.nativeEvent.stopImmediatePropagation();
                        handleSaveAllWishlist();
                    }}
                />

                <CustomButton
                    type="button"
                    label="Return"
                    width="clamp(300px, 30vw, 450px)"
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
                    disabled={isLoading}
                    onClick={(e) => {
                        e.stopPropagation();
                        e.nativeEvent.stopImmediatePropagation();
                        onReturn();
                    }}
                >
                    <IoMdReturnLeft />
                </CustomButton>
            </div>
        </div>
    );
};

export default DiagnosticComparison;
