import { useState } from "react";
import { validateField } from "../../utils/validators";
import useFormHandler from "../../hooks/useFormHandler";
import useApiClients from "../../services/useApiClients";
import CustomSelect from "../static/Dropdown/CustomSelect";
import CustomModal from "../static/CustomModal/CustomModal";
import { useUserContext } from "../../contexts/UserContext";
import { useFetchData } from "../../hooks/useFetchData";

const MoveFileModal = ({ modalType, onOpen, onClose, foldersList, prescriptionId, refetch }) => {
    const { buttonIcons, handleInputChange, resetForm } = useFormHandler();
    const { user } = useUserContext();
    // Destructuring API service methods
    const { api } = useApiClients();

    const initialData = {
        PrescriptionId: prescriptionId,
        FolderId: "",
        UserId: Number(user?.jti),
        IsExistingPatient: null,
        PatientProfileId: null,
        HasExistingRelative: null,
        RelativePatientIds: null,
        IsLocked: null,
        IsReported: null,
        ReportReason: null,
        ReportDetails: null,
        IsRecommended: null,
        IsApproved: null,
        IsCompleted: null,
        UpdatedBy: 7,
        Tag1: "",
        Tag2: null,
        Tag3: null,
        Tag4: null,
        Tag5: null,
    };

    // State to manage form data
    const [formData, setFormData] = useState(initialData);
    // State to manage individual field errors
    const [fieldErrors, setFieldErrors] = useState(initialData);
    // State to manage loading status
    const [isLoading, setIsLoading] = useState(false);

    const handleSubmit = async (e) => {
        e.preventDefault();

        const fieldsToValidate = {
            FolderId: validateField("FolderId", formData.FolderId, "Folder name"),
        };

        if (Object.values(fieldsToValidate).some((error) => error)) {
            setFieldErrors(fieldsToValidate);
            return;
        }

        try {
            setIsLoading(true);
            const newData = {
                ...formData,
                PrescriptionId: prescriptionId,
            };

            // API call to assign roles to the selected user
            const response = await api.moveFile(newData, prescriptionId, "");

            // If API call is successful or returns an object, reset the form
            if (response.message === "Successful" || typeof response === "object") {
                onClose(); // close modal after navigation if you want
                refetch(); // Refetch the data after moving the file
                resetForm(initialData, setFormData, setFieldErrors); // Reset the form
            }
        } catch (e) {
            console.error(e);
        } finally {
            setIsLoading(false); // Reset loading state
        }
    };

    return (
        <CustomModal
            isOpen={onOpen}
            modalName={"Move File"}
            close={onClose}
            animationDirection="top"
            position="top"
            form={true}
            onSubmit={handleSubmit}
            isButtonLoading={isLoading}
            buttonType={"submit"}
            buttonIcon={buttonIcons[modalType]}
            buttonLabel={"Move"}
            isButtonDisabled={isLoading}
            buttonWidth={"100%"}
            buttonBackgroundColor={""}
            buttonTextColor={"var(--theme-font-color)"}
            buttonShape={"pill"}
            buttonBorderStyle={""}
            buttonBorderColor={"2px solid var(--theme-font-color)"}
            buttonIconStyle={{ color: "var(--theme-font-color)" }}
            buttonLabelStyle={{ fontWeight: "500" }}
        >
            <div className="overflow-hidden px-1">
                <CustomSelect
                    name="FolderId"
                    value={formData.FolderId}
                    onChange={(e) => handleInputChange(e, setFormData, setFieldErrors, "select", "FolderId")}
                    options={
                        foldersList?.map((folder) => ({
                            key: folder.id,
                            label: folder?.folderName,
                            value: folder.id,
                        })) || []
                    }
                    placeholder="Select Folder"
                    icon={""}
                    bgColor="#E6E4EF"
                    textColor=""
                    borderRadius="5px"
                    width="100%"
                    error={fieldErrors?.FolderId}
                    className="mb-5 mt-3 pb-5"
                    dropdownTrayHight="80px"
                />
            </div>
        </CustomModal>
    );
};

export default MoveFileModal;
