import React, { useEffect, useState } from "react";
import CustomModal from "../../static/CustomModal/CustomModal";
import CustomButton from "../../static/Commons/CustomButton";
import CustomSelect from "../../static/Dropdown/CustomSelect";
import useApiClients from "../../../services/useApiClients";
import { useUserContext } from "../../../contexts/UserContext";
import useFormHandler from "../../../hooks/useFormHandler";

const AddEditTestCenterModal = ({
    isOpen,
    modalType,
    onClose,
    onAdd,
    testCenterAndTestListData,
    doctorRecommendedTestListData,
    doctorRecommendedTestCenterAndTestListData,
    SmartRxMasterId,
    PrescriptionId,
    LoginUserId,
    smartRxInsiderDataRefetch,
}) => {
    const { api } = useApiClients();
    const { user } = useUserContext();
    const { handleInputChange, resetForm } = useFormHandler();

    const initialData = {
        DiagnosticCenterName: "",
        Branch: "",
        InvestigationId: "",
    };

    const [formData, setFormData] = useState(initialData);
    const [fieldErrors, setFieldErrors] = useState(initialData);

    const [selectedTests, setSelectedTests] = useState({});
    const [addedCenters, setAddedCenters] = useState([]);
    const [centerRemoveError, setCenterRemoveError] = useState("");
    const [isLoading, setIsLoading] = useState(false);

    const [doctorRecommendedCenters, setDoctorRecommendedCenters] = useState(
        []
    );

    useEffect(() => {
        if (!isOpen) {
            resetForm(initialData, setFormData, setFieldErrors);
            setSelectedTests({});
            setDoctorRecommendedCenters([]);
            setAddedCenters([]); // Reset user-added centers when modal closes
        } else {
            setDoctorRecommendedCenters(
                doctorRecommendedTestCenterAndTestListData || []
            );
            setAddedCenters([]); // Always clear user-added centers when modal opens

            const initialSelections = {};

            console.log("Doctor Recommended Centers:", doctorRecommendedTestCenterAndTestListData);

            // ✅ Handle doctor recommended centers
            (doctorRecommendedTestCenterAndTestListData || []).forEach(
                ({ center, tests }) => {
                    (tests || []).forEach((test) => {
                        const ids = test?.testCenterIds?.split(",") || [];
                        ids.forEach((id) => {
                            const key = `${id}_${test.testName}`;
                            initialSelections[key] = true;
                        });
                    });
                }
            );

            // Do NOT restore addedCenters selections

            console.log(
                "Initial selected keys:",
                Object.keys(initialSelections)
            );
            setSelectedTests(initialSelections);
        }
    }, [isOpen, doctorRecommendedTestCenterAndTestListData]);

    const handleRemoveCenter = (centerId) => {
        setAddedCenters((prev) =>
            prev.filter((entry) => entry.center.testCenterId !== centerId)
        );
    };

    const toggleTestSelection = (centerId, testName) => {
        const key = `${centerId}_${testName}`;
        console.log("Key toggle: ", key);
        setSelectedTests((prev) => ({
            ...prev,
            [key]: !prev[key],
        }));
    };

    const getTestSelectionCount = (testName) => {
        let count = 0;
        Object.keys(selectedTests).forEach((key) => {
            if (key.endsWith(`_${testName}`) && selectedTests[key]) {
                count++;
            }
        });
        return count;
    };

    const groupTestsByCenter = (tests) => {
        const grouped = {};

        tests.forEach((test) => {
            if (!Array.isArray(test.testCenters)) return;

            test.testCenters.forEach((center) => {
                const centerId = center?.id;
                const centerName = center?.name || "Unknown Center";

                if (!centerId) return;

                if (!grouped[centerId]) {
                    grouped[centerId] = {
                        centerName,
                        tests: [],
                    };
                }

                grouped[centerId].tests.push(test);
            });
        });

        return grouped;
    };

    const handleRemoveDoctorRecommendedCenter = (centerIdToRemove) => {
        // Check if any selected test belongs to this centerId
        const isAnySelected = Object.keys(selectedTests).some((key) => {
            const [id] = key.split("_"); // extract centerId from key
            return id === centerIdToRemove && selectedTests[key];
        });

        if (isAnySelected) {
            setCenterRemoveError(
                "Please unselect all tests from this center before removing."
            );
            setTimeout(() => setCenterRemoveError(""), 2000);
            return;
        }

        // Proceed with removal
        setDoctorRecommendedCenters((prev) =>
            prev
                .map(({ center, tests }) => {
                    const updatedTests = tests
                        .map((test) => {
                            const centerIds = test.testCenterIds
                                ?.split(",")
                                .map((id) => id.trim());
                            const testCenters = [...(test.testCenters || [])];

                            const indexToRemove = centerIds.findIndex(
                                (id) => id === centerIdToRemove
                            );

                            if (indexToRemove === -1) return test;

                            centerIds.splice(indexToRemove, 1);
                            testCenters.splice(indexToRemove, 1);

                            return {
                                ...test,
                                testCenterIds: centerIds.join(","),
                                testCenters,
                            };
                        })
                        .filter(
                            (test) =>
                                test.testCenterIds !== "" &&
                                test.testCenters.length > 0
                        );

                    return updatedTests.length > 0
                        ? { center, tests: updatedTests }
                        : null;
                })
                .filter(Boolean)
        );

        setSelectAll(false);
    };

    const uniqueTestCenters = Array.from(
        new Map(
            testCenterAndTestListData?.testCenters?.map((item) => [
                item.testCenterId,
                item,
            ])
        ).values()
    );

    const handleAddCenter = () => {
        if (!formData.DiagnosticCenterName) return;

        const centerId = parseInt(formData.DiagnosticCenterName);
        const selectedCenter = uniqueTestCenters.find(
            (item) => item.testCenterId === centerId
        );

        if (!selectedCenter) return;

        const alreadyExists = addedCenters.some(
            (entry) => entry.center.testCenterId === centerId
        );
        if (alreadyExists) return;

        // Use all tests from doctorRecommendedTestCenterAndTestListData
        const relatedTests =
            doctorRecommendedTestCenterAndTestListData?.flatMap(
                ({ tests }) => tests
            ) || [];

        setAddedCenters((prev) => [
            ...prev,
            {
                center: selectedCenter,
                tests: relatedTests,
            },
        ]);

        resetForm(initialData, setFormData, setFieldErrors);
    };

    const testCenter = uniqueTestCenters?.map((option) => ({
        value: option.testCenterId,
        label: option.testCenterBranch
            ? `${option.testCenterName} - ${option.testCenterBranch}`
            : option.testCenterName,
    }));

    const [filteredBranches, setFilteredBranches] = useState([]);

    const branch = uniqueTestCenters
        ?.filter((option) => option.testCenterBranch)
        ?.map((option) => ({
            value: option.testCenterId,
            label: option.testCenterBranch,
        }));

    const [selectAll, setSelectAll] = useState(false);

    const areAllTestsSelected = () => {
        const allKeys = [];

        doctorRecommendedCenters.forEach(({ tests }) => {
            const groupedTests = groupTestsByCenter(tests);
            Object.entries(groupedTests).forEach(([centerName, testList]) => {
                testList.forEach((test) => {
                    allKeys.push(`${center?.id}_${test.testName}`);
                });
            });
        });

        return allKeys.every((key) => selectedTests[key]);
    };

    //NEW code for Edit API
    const handleSaveSelectedCenters = async (e) => {
        e.preventDefault();

        if (!SmartRxMasterId || !PrescriptionId || !LoginUserId) {
            console.error(
                "Missing SmartRxMasterId or PrescriptionId or LoginUserId"
            );
            return;
        }

        setIsLoading(true);

        try {
            const testToCentersMap = new Map();

            const processTest = (centerId, test) => {
                const testName = test?.testName?.trim();
                if (!testName || !centerId) return;

                const key = `${centerId}_${testName}`;
                const isChecked = selectedTests?.[key];

                if (!isChecked) return;

                const mapKey = testName;

                const matchingTest = doctorRecommendedTestCenterAndTestListData
                    .flatMap((c) => c.tests || [])
                    .find(
                        (t) =>
                            t.testName?.trim().toLowerCase() ===
                            testName.toLowerCase()
                    );

                const testId =
                    test.testId ||
                    matchingTest?.testId ||
                    matchingTest?.id ||
                    0;
                const investigationId = matchingTest?.id || 0;

                if (!testToCentersMap.has(mapKey)) {
                    testToCentersMap.set(mapKey, {
                        TestId: testId,
                        CenterIds: new Set([centerId]),
                        InvestigationId: investigationId,
                    });
                } else {
                    const existing = testToCentersMap.get(mapKey);
                    existing.CenterIds.add(centerId);
                }
            };

            // Doctor Recommended Centers (split test.testCenterIds)
            doctorRecommendedCenters.forEach(({ tests }) => {
                if (!Array.isArray(tests)) return;

                tests.forEach((test) => {
                    const testName = test?.testName?.trim();
                    const testCenterIds = test?.testCenterIds?.split(",") || [];

                    testCenterIds.forEach((cid) => {
                        const centerId = cid.trim();
                        processTest(centerId, test);
                    });
                });
            });

            // User Added Centers (addedCenters)
            addedCenters.forEach(({ center, tests }) => {
                const centerId = center?.testCenterId?.toString();
                if (!centerId || !Array.isArray(tests)) return;

                tests.forEach((test) => {
                    processTest(centerId, test);
                });
            });

            // Final formatted payload with max 2 TestCenterIds per test
            const patientTestCenterWiseList = Array.from(
                testToCentersMap.values()
            ).map(({ TestId, CenterIds, InvestigationId }) => {
                const limitedCenterIds = Array.from(CenterIds).slice(0, 2);

                return {
                    Id: InvestigationId || 0,
                    SmartRxMasterId,
                    PrescriptionId,
                    TestId,
                    TestCenterIds: limitedCenterIds.join(","),
                };
            });

            const body = {
                SmartRxMasterId,
                PrescriptionId,
                PatientTestCenterWiseList: patientTestCenterWiseList,
                LoginUserId,
            };

            console.log("Final Payload to API:", body);

            await api.investigationCenterListUpdate(body, "");
            onClose();
            smartRxInsiderDataRefetch();
        } catch (error) {
            console.error("Error in handleSaveSelectedCenters:", error);
        } finally {
            setIsLoading(false);
        }
    };

    return (
        <CustomModal
            isOpen={isOpen}
            modalName={
                <span
                    style={{
                        color: "#65636e",
                        fontWeight: "1000",
                        fontSize: "20px",
                        fontFamily: "Georama",
                    }}
                >
                    Change Test Centers
                </span>
            }
            close={onClose}
            animationDirection="bottom"
            modalSize="medium"
            position="middle"
            closeOnOverlayClick={false}
            dataPreview
            form
        >
            <div className="fade-in">
                <div className="mb-3" style={{ textAlign: "left" }}>
                    <CustomSelect
                        label="Diagnostic Center"
                        labelPosition="top-left"
                        placeholder="Select a Test Center"
                        name="DiagnosticCenterName"
                        value={formData.DiagnosticCenterName}
                        onChange={(e) => {
                            const selectedId = parseInt(e.target.value);
                            const selectedCenter = uniqueTestCenters.find(
                                (center) => center.testCenterId === selectedId
                            );

                            // Update formData DiagnosticCenterName to selectedId as string
                            setFormData((prev) => ({
                                ...prev,
                                DiagnosticCenterName: e.target.value,
                                // Optionally keep branch internally if needed:
                                Branch: selectedCenter?.testCenterBranch || "",
                            }));

                            setFieldErrors((prev) => ({
                                ...prev,
                                DiagnosticCenterName: null,
                            }));
                        }}
                        textColor="#65636e"
                        borderColors="1px solid #65636e"
                        width="100%"
                        options={testCenter}
                    />
                </div>

                <div className="w-100 d-flex justify-content-end">
                    <CustomButton
                        type="button"
                        label="Add"
                        className="investigation-action-btn mt-2"
                        width="clamp(80px, 30vw, 80px)"
                        height="clamp(30px, 2.3vw, 30px)"
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
                        onClick={handleAddCenter}
                    />
                </div>

                <div style={{ marginTop: "2px", textAlign: "left" }}>
                    <span
                        style={{
                            width: "clamp(62%, 30vw, 62%)",
                            textAlign: "left",
                            fontWeight: "500",
                            fontSize: "12px",
                            color: "#e51e1eff",
                        }}
                    >
                        Only 2 test centers can be selected for free. <br />
                        Redeem reward points to add more.
                    </span>

                    {/* Doctor Recommended Centers */}

                    {/* Group by unique test center ID and display center name and tests (using uniqueTestCenters for name/id mapping) */}
                    {(() => {
                        // Gather all tests from all doctorRecommendedCenters
                        const allTests = doctorRecommendedCenters.flatMap(d => d.tests || []);
                        // Build a map of centerId to centerName from uniqueTestCenters
                        const centerIdToName = {};
                        uniqueTestCenters.forEach(center => {
                            centerIdToName[center.testCenterId?.toString()] = center.testCenterName;
                        });
                        // Group tests by centerId
                        const centerIdMap = new Map();
                        for (const test of allTests) {
                            const idsArr = (test.testCenterIds || '').split(',').map(id => id.trim());
                            idsArr.forEach((id) => {
                                if (!id) return;
                                if (!centerIdMap.has(id)) {
                                    centerIdMap.set(id, []);
                                }
                                // Only add the test if not already present for this centerId
                                if (!centerIdMap.get(id).some(t => t.testName === test.testName)) {
                                    centerIdMap.get(id).push(test);
                                }
                            });
                        }
                        return Array.from(centerIdMap.entries()).map(([centerId, filteredTests]) => {
                            const centerName = centerIdToName[centerId] || 'Unnamed Center';
                            // Helper to count how many times this test is selected across centers
                            const getTestSelectionCount = (testName) =>
                                Object.keys(selectedTests).filter(
                                    (key) =>
                                        key.endsWith(`_${testName}`) &&
                                        selectedTests[key]
                                ).length;

                            // Generate keys for all tests under this center
                            const testKeys = filteredTests.map(
                                (test) => `${centerId}_${test.testName}`
                            );
                            const allSelected = testKeys.length > 0 && testKeys.every(
                                (key) => selectedTests[key]
                            );
                            const anySelected = testKeys.some(
                                (key) => selectedTests[key]
                            );

                            if (filteredTests.length === 0) return null;

                            return (
                                <div
                                    key={`doctor-${centerId}`}
                                    style={{ marginBottom: "20px", borderBottom: "1px solid #ddd" }}
                                >
                                    {/* Center Header */}
                                    <div
                                        style={{
                                            display: "flex",
                                            alignItems: "center",
                                            gap: "8px",
                                            marginBottom: "8px",
                                        }}
                                    >
                                        <input
                                            type="checkbox"
                                            checked={anySelected}
                                            onChange={() => {
                                                const updated = { ...selectedTests };
                                                testKeys.forEach((key) => {
                                                    updated[key] = !allSelected;
                                                });
                                                setSelectedTests(updated);
                                            }}
                                            style={{
                                                accentColor: "#4b3b8b",
                                                width: "clamp(5%, 30vw, 5%)",
                                                height: "clamp(5%, 30vw, 5%)",
                                                transform: "scale(1.2)",
                                                marginRight: "0",
                                            }}
                                        />
                                        <strong
                                            style={{
                                                color: "#65636e",
                                                fontSize: "16px",
                                            }}
                                        >
                                            {centerName}
                                        </strong>
                                        <div style={{ marginLeft: "auto" }}>
                                            <CustomButton
                                                type="button"
                                                label="✖ Remove"
                                                className="investigation-action-btn mt-2"
                                                width="clamp(80px, 30vw, 80px)"
                                                height="clamp(30px, 2.3vw, 30px)"
                                                textColor="red"
                                                backgroundColor="#FAF8FA"
                                                borderRadius="3px"
                                                shape="Square"
                                                borderColor="1px solid red"
                                                labelStyle={{
                                                    fontSize: "clamp(12px, 2vw, 13px)",
                                                    fontWeight: "600",
                                                    textTransform: "capitalize",
                                                }}
                                                hoverEffect="theme"
                                                onClick={() => handleRemoveDoctorRecommendedCenter(centerId)}
                                            />
                                        </div>
                                    </div>

                                    {/* Tests under this center */}
                                    <div style={{ marginLeft: "20px" }}>
                                        {filteredTests.map((test, idx) => {
                                            const key = `${centerId}_${test.testName}`;
                                            const isChecked = !!selectedTests[key];
                                            const selectedCount = getTestSelectionCount(test.testName);
                                            return (
                                                <div
                                                    key={key}
                                                    style={{
                                                        display: "flex",
                                                        alignItems: "center",
                                                        gap: "10px",
                                                        minHeight: "28px",
                                                        fontSize: "clamp(13px, 2vw, 16px)",
                                                        padding: "4px 0",
                                                    }}
                                                >
                                                    <input
                                                        type="checkbox"
                                                        checked={isChecked}
                                                        onChange={() =>
                                                            toggleTestSelection(centerId, test.testName, test.investigationId)
                                                        }
                                                        disabled={!isChecked && selectedCount >= 2}
                                                        style={{
                                                            transform: "scale(1.2)",
                                                            width: "clamp(5%, 30vw, 5%)",
                                                            marginRight: "0",
                                                        }}
                                                    />
                                                    <span
                                                        style={{
                                                            width: "clamp(62%, 30vw, 62%)",
                                                            textAlign: "left",
                                                        }}
                                                    >
                                                        {test.testName}
                                                    </span>
                                                    <span
                                                        style={{
                                                            textAlign: "left",
                                                            borderLeft: "2px solid #000",
                                                            paddingLeft: "15px",
                                                            width: "clamp(33%, 30vw, 33%)",
                                                        }}
                                                    >
                                                        BDT {test.testUnitPrice ?? "N/A"}
                                                    </span>
                                                </div>
                                            );
                                        })}
                                    </div>
                                </div>
                            );
                        });
                    })()}

                    {centerRemoveError && (
                        <div
                            style={{
                                color: "red",
                                fontSize: "14px",
                                marginBottom: "10px",
                                fontWeight: "500",
                            }}
                        >
                            {centerRemoveError}
                        </div>
                    )}

                    {/* User-added Centers */}

                    {addedCenters.map(({ center, tests }, index) => {
                        const centerId = center.testCenterId;

                        // Generate keys for all tests under this center
                        const testKeys = tests.map(
                            (test) => `${centerId}_${test.testName}`
                        );
                        const allSelected = testKeys.every(
                            (key) => selectedTests[key]
                        );
                        const anySelected = testKeys.some(
                            (key) => selectedTests[key]
                        );

                        return (
                            <div
                                key={`added-${centerId}`}
                                style={{ marginBottom: "20px" }}
                            >
                                <div
                                    style={{
                                        display: "flex",
                                        flexDirection: "column",
                                        gap: "4px",
                                    }}
                                >
                                    <div
                                        style={{
                                            display: "flex",
                                            alignItems: "center",
                                            gap: "8px",
                                        }}
                                    >
                                        {/* ✅ Select All Checkbox */}
                                        <input
                                            type="checkbox"
                                            checked={anySelected}
                                            onChange={() => {
                                                const updated = {
                                                    ...selectedTests,
                                                };
                                                testKeys.forEach((key) => {
                                                    updated[key] = !allSelected;
                                                });
                                                setSelectedTests(updated);
                                            }}
                                            style={{
                                                accentColor: "#4b3b8b",
                                                width: "clamp(5%, 30vw, 5%)",
                                                height: "clamp(5%, 30vw, 5%)",
                                                transform: "scale(1.2)",
                                                marginRight: "0",
                                            }}
                                        />

                                        {/* Center Name */}
                                        <strong style={{ color: "#65636e" }}>
                                            {center.testCenterName}
                                        </strong>

                                        <div style={{ marginLeft: "auto" }}>
                                            <CustomButton
                                                type="button"
                                                label="✖ Remove"
                                                className="investigation-action-btn mt-2"
                                                width="clamp(80px, 30vw, 80px)"
                                                height="clamp(30px, 2.3vw, 30px)"
                                                textColor="red"
                                                backgroundColor="#FAF8FA"
                                                borderRadius="3px"
                                                shape="Square"
                                                borderColor="1px solid red"
                                                labelStyle={{
                                                    fontSize:
                                                        "clamp(12px, 2vw, 13px)",
                                                    fontWeight: "600",
                                                    textTransform: "capitalize",
                                                }}
                                                hoverEffect="theme"
                                                onClick={() =>
                                                    handleRemoveCenter(centerId)
                                                }
                                            />
                                        </div>
                                    </div>
                                </div>

                                {/* Tests under this center */}
                                <div
                                    style={{
                                        marginLeft: "16px",
                                        marginTop: "8px",
                                    }}
                                >
                                    {tests?.map((test, idx) => {
                                        const key = `${centerId}_${test.testName}`;
                                        const isChecked = !!selectedTests[key];
                                        const selectedCount =
                                            getTestSelectionCount(
                                                test.testName
                                            );

                                        return (
                                            <div
                                                key={idx}
                                                style={{
                                                    display: "flex",
                                                    alignItems: "center",
                                                    gap: "10px",
                                                    lineHeight: "28px",
                                                    fontSize:
                                                        "clamp(13px, 2vw, 16px)",
                                                }}
                                            >
                                                <input
                                                    type="checkbox"
                                                    checked={isChecked}
                                                    disabled={
                                                        !isChecked &&
                                                        selectedCount >= 2
                                                    }
                                                    onChange={() =>
                                                        toggleTestSelection(
                                                            centerId,
                                                            test.testName,
                                                            center.investigationId
                                                        )
                                                    }
                                                    style={{
                                                        transform: "scale(1.2)",
                                                        width: "clamp(5%, 30vw, 5%)",
                                                    }}
                                                />
                                                <span
                                                    style={{
                                                        width: "clamp(62%, 30vw, 62%)",
                                                        textAlign: "left",
                                                    }}
                                                >
                                                    {test.testName}
                                                </span>
                                                <span
                                                    style={{
                                                        textAlign: "left",
                                                        borderLeft:
                                                            "2px solid #000",
                                                        paddingLeft: "15px",
                                                        width: "clamp(33%, 30vw, 33%)",
                                                    }}
                                                >
                                                    BDT{" "}
                                                    {test.testUnitPrice ??
                                                        "N/A"}
                                                </span>
                                            </div>
                                        );
                                    })}
                                </div>
                            </div>
                        );
                    })}
                </div>

                <div className="w-100 d-flex justify-content-center gap-2 mt-3">
                    <CustomButton
                        type="button"
                        label="Submit"
                        className="investigation-action-btn mt-2"
                        width="clamp(80px, 30vw, 80px)"
                        height="clamp(30px, 2.3vw, 30px)"
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
                        onClick={handleSaveSelectedCenters}
                    />

                    {/* <CustomButton
                        type="button"
                        label="Close"
                        className="investigation-action-btn mt-2"
                        width="clamp(80px, 30vw, 80px)"
                        height="clamp(30px, 2.3vw, 30px)"
                        textColor="#ffffff"
                        backgroundColor="#4b3b8b"
                        borderRadius="3px"
                        shape="Square"
                        borderColor="1px solid var(--theme-font-color)"
                        labelStyle={{
                            fontSize: "clamp(14px, 2vw, 16px)",
                            fontWeight: "100",
                            textTransform: "capitalize",
                        }}
                        hoverEffect="theme"
                        onClick={onClose}
                    /> */}
                </div>
            </div>
        </CustomModal>
    );
};

export default AddEditTestCenterModal;
