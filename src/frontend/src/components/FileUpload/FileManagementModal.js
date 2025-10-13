// import { useEffect, useState } from "react";
// import { validateField } from "../../utils/validators";
// import CustomInput from "../static/Commons/CustomInput";
// import useFormHandler from "../../hooks/useFormHandler";
// import useApiService from "../../services/useApiService";
// import { useUserContext } from "../../contexts/UserContext";
// import CustomModal from "../static/CustomModal/CustomModal";
// import DeleteModal from "../static/Commons/FormFields/DeleteModal/DeleteModal";
// import { CREATE_NEW_FOLDER_URL, DELETE_FILE_URL, RENAME_FOLDER_URL } from "../../constants/apiEndpoints";

// const FileManagementModal = ({ modalType, isOpen, fileData, onClose, fetchFolders, folderRefetch, onFileSelected }) => {
//     const { dynamicModalName, buttonIcons, dynamicButtonLabel, handleInputChange, resetForm, dynamicActions, toPascalCase } = useFormHandler();
//     const { user } = useUserContext();

//     // Destructuring API service methods
//     const apiServices = useApiService();

//     const initialData = {
//         PrescriptionId: fileData?.fileId ?? "",
//         ParentFolderId: fileData?.folderId ?? user?.PrimaryFolderId,
//         PreviousFolderHierarchy: fileData?.folderName === "Primary" ? 0 : fileData?.folderHierarchy,
//         FolderHierarchy: fileData?.folderHierarchy ?? user?.PrimaryFolderHeirarchy,
//         FileName: "",
//         FolderId: fileData?.folderId ?? user?.PrimaryFolderId,
//         UserId: Number(user?.jti),
//         LoginUserId: Number(user?.jti),
//         File: [], // Assuming you want to handle file uploads
//     };

//     // State to manage form data
//     const [formData, setFormData] = useState(initialData);

//     // State to manage individual field errors
//     const [fieldErrors, setFieldErrors] = useState(initialData);

//     // State to manage loading status
//     const [isLoading, setIsLoading] = useState(false);

//     // Get modal names and button labels dynamically based on modal type
//     const modalNames = dynamicModalName("File");
//     const buttonLabels = dynamicButtonLabel("File");

//     // Function to handle reset fields value

//     // Effect to initialize form data based on modal type and topic(passed props)
//     useEffect(() => {
//         if ((modalType === "rename" || modalType === "delete") && fileData) {
//             // Extract necessary properties from fileData
//             const { folderName, fileId, folderId, parentFolderId, folderHeirarchy, Description, uniqueCode, status } = fileData;

//             setFormData({
//                 ...formData,
//                 PrescriptionId: fileId,
//                 FolderId: folderId ? folderId : user?.PrimaryFolderId,
//                 ParentFolderId: parentFolderId,
//                 PreviousFolderHierarchy: folderHeirarchy,
//                 FolderHierarchy: folderHeirarchy,
//                 FolderName: folderName || "",
//                 LoginUserId: Number(user?.jti),
//                 UserId: Number(user?.jti), //user?.jti
//             });
//         } else {
//             // Clear form data if modalType is not 'edit' and Clear empty field error on close modal
//             resetForm(initialData, setFormData, setFieldErrors);
//         }
//     }, [modalType, fileData]);

//     const handleFileChange = () => {
//         onFileSelected(formData, "crop");
//         onClose();
//         // Clear form data if modalType is not 'edit' and Clear empty field error on close modal
//         resetForm(initialData, setFormData, setFieldErrors);
//     };

//     // Function to handle form submission
//     const handleSubmit = async (e) => {
//         e.preventDefault();

//         // Validate fields based on modalType
//         if (modalType !== "delete") {
//             const fieldsToValidate = {
//                 FileName: validateField("FileName", formData.FileName, "File Name"),
//                 File: formData.File.length === 0 ? "At least one file must be selected." : "",
//             };
//             // Validate all fields before submission
//             if (Object.values(fieldsToValidate).some((error) => error !== "")) {
//                 setFieldErrors(fieldsToValidate);
//                 return;
//             }
//         }

//         try {
//             setIsLoading(true);

//             const dynamicUrl = {
//                 add: CREATE_NEW_FOLDER_URL, // Label for the "add" modal type
//                 rename: RENAME_FOLDER_URL, // Label for the "edit" modal type
//                 delete: DELETE_FILE_URL, // Label for the "delete" modal type
//             };

//             // Define actions for different modal types
//             const actions = dynamicActions(dynamicUrl[modalType], formData, fileData?.fileId, apiServices, "");

//             // API call to assign roles to the selected user
//             const response = modalType === "delete" ? await actions[modalType]() : handleFileChange();

//             // Check the response and update the form data with success or error message
//             if (response?.message === "Successful" || typeof response === "object") {
//                 fetchFolders && fetchFolders();
//                 folderRefetch && folderRefetch();
//                 onClose();
//             }
//         } catch (e) {
//             console.error(e);
//         } finally {
//             setIsLoading(false); // Reset loading state
//         }
//     };

//     return (
//         <CustomModal
//             isOpen={isOpen}
//             modalName={modalNames[modalType]}
//             close={onClose}
//             animationDirection="top"
//             position="top"
//             form={true}
//             onSubmit={handleSubmit}
//             isButtonLoading={isLoading}
//             buttonType={"submit"}
//             buttonIcon={buttonIcons[modalType]}
//             buttonLabel={toPascalCase(buttonLabels[modalType])}
//             isButtonDisabled={isLoading}
//             buttonWidth={"100%"}
//             buttonBackgroundColor={""}
//             buttonTextColor={"var(--theme-font-color)"}
//             buttonShape={"pill"}
//             buttonBorderStyle={""}
//             buttonBorderColor={"2px solid var(--theme-font-color)"}
//             buttonIconStyle={{ color: "var(--theme-font-color)" }}
//             buttonLabelStyle={{ fontWeight: "500" }}
//             closeOnOverlayClick={false}
//         >
//             {modalType === "delete" ? (
//                 <div>
//                     <DeleteModal
//                         // value={formData.deleteRemarks}
//                         // onChange={(e) => handleInputChange(e, setFormData, setFieldErrors, "input", "deleteRemarks")}
//                         // error={!!fieldErrors.deleteRemarks}
//                         // helperText={fieldErrors.deleteRemarks}
//                         text="folder"
//                         value={""}
//                         onChange={""}
//                         error={""}
//                         helperText={""}
//                     />
//                 </div>
//             ) : (
//                 <>
//                     <CustomInput
//                         className="input-style"
//                         label="File Name"
//                         labelPosition="top-left"
//                         name="FileName"
//                         type="text"
//                         placeholder="File Name"
//                         value={formData.FileName}
//                         onChange={(e) => handleInputChange(e, setFormData, setFieldErrors, "input", "File name")}
//                         error={fieldErrors.FileName}
//                         disabled={isLoading}
//                     />

//                     <CustomInput
//                         className="input-style"
//                         label="File"
//                         labelPosition="top-left"
//                         name="File"
//                         type="file"
//                         placeholder="File"
//                         value={formData.File}
//                         onChange={(e) => handleInputChange(e, setFormData, setFieldErrors, "multipleFile", "File")}
//                         disabled={isLoading}
//                         error={fieldErrors.File}
//                         multiple={true}
//                     />
//                 </>
//             )}
//         </CustomModal>
//     );
// };

// export default FileManagementModal;

import { useEffect, useState, useRef } from "react";
import { validateField } from "../../utils/validators";
import CustomInput from "../static/Commons/CustomInput";
import useFormHandler from "../../hooks/useFormHandler";
import useApiService from "../../services/useApiService";
import { useUserContext } from "../../contexts/UserContext";
import CustomModal from "../static/CustomModal/CustomModal";
import DeleteModal from "../static/Commons/FormFields/DeleteModal/DeleteModal";
import { CREATE_NEW_FOLDER_URL, DELETE_FILE_URL, RENAME_FOLDER_URL } from "../../constants/apiEndpoints";

const FileManagementModal = ({ modalType, isOpen, fileData, onClose, fetchFolders, folderRefetch, onFileSelected }) => {
    const { dynamicModalName, buttonIcons, dynamicButtonLabel, handleInputChange, resetForm, dynamicActions, toPascalCase } = useFormHandler();
    const { user } = useUserContext();
    const apiServices = useApiService();

    const fileInputRef = useRef([]); // 🚫 Avoid keeping large file blobs in React state

    const initialData = {
        PrescriptionId: fileData?.fileId ?? "",
        ParentFolderId: fileData?.folderId ?? user?.PrimaryFolderId,
        PreviousFolderHierarchy: fileData?.folderName === "Primary" ? 0 : fileData?.folderHierarchy,
        FolderHierarchy: fileData?.folderHierarchy ?? user?.PrimaryFolderHeirarchy,
        FileName: "",
        FolderId: fileData?.folderId ?? user?.PrimaryFolderId,
        UserId: Number(user?.jti),
        LoginUserId: Number(user?.jti),
    };

    const [formData, setFormData] = useState(initialData);
    const [fieldErrors, setFieldErrors] = useState({});
    const [isLoading, setIsLoading] = useState(false);

    const modalNames = dynamicModalName("File");
    const buttonLabels = dynamicButtonLabel("File");

    useEffect(() => {
        if ((modalType === "rename" || modalType === "delete") && fileData) {
            const { folderName, fileId, folderId, parentFolderId, folderHeirarchy } = fileData;
            setFormData((prev) => ({
                ...prev,
                PrescriptionId: fileId,
                FolderId: folderId ?? user?.PrimaryFolderId,
                ParentFolderId: parentFolderId,
                PreviousFolderHierarchy: folderHeirarchy,
                FolderHierarchy: folderHeirarchy,
                FolderName: folderName || "",
            }));
        } else {
            resetForm(initialData, setFormData, setFieldErrors);
        }
    }, [modalType, fileData]);

    const handleFileChange = (e) => {
        const selectedFiles = Array.from(e.target.files || []);
        
        // Validate file types - only accept images and PDFs
        const allowedTypes = [
            'image/jpeg',
            'image/jpg', 
            'image/png',
            'image/gif',
            'image/webp',
            'application/pdf'
        ];
        
        const validFiles = selectedFiles.filter(file => allowedTypes.includes(file.type));
        const invalidFiles = selectedFiles.filter(file => !allowedTypes.includes(file.type));
        
        let fileError = "";
        
        if (selectedFiles.length === 0) {
            fileError = "Please select at least one file.";
        } else if (invalidFiles.length > 0) {
            const invalidFileNames = invalidFiles.map(file => file.name).join(', ');
            fileError = `Invalid file type(s): ${invalidFileNames}. Only images (JPEG, PNG, GIF, WebP) and PDF files are allowed.`;
        } else if (validFiles.length !== selectedFiles.length) {
            fileError = "Some files were filtered out due to invalid file types.";
        }
        
        fileInputRef.current = validFiles;

        setFieldErrors((prev) => ({
            ...prev,
            File: fileError,
        }));
    };

    const handleSubmit = async (e) => {
        e.preventDefault();

        if (modalType !== "delete") {
            const fileNameError = validateField("FileName", formData.FileName, "File Name");
            
            // Additional validation for file types on submit
            const allowedTypes = [
                'image/jpeg',
                'image/jpg', 
                'image/png',
                'image/gif',
                'image/webp',
                'application/pdf'
            ];
            
            let fileError = "";
            
            if (fileInputRef.current.length === 0) {
                fileError = "At least one file must be selected.";
            } else {
                // Double-check file types on submit
                const invalidFiles = fileInputRef.current.filter(file => !allowedTypes.includes(file.type));
                if (invalidFiles.length > 0) {
                    const invalidFileNames = invalidFiles.map(file => file.name).join(', ');
                    fileError = `Invalid file type(s): ${invalidFileNames}. Only images (JPEG, PNG, GIF, WebP) and PDF files are allowed.`;
                }
            }

            const fieldsToValidate = {
                FileName: fileNameError,
                File: fileError,
            };

            if (fileNameError || fileError) {
                setFieldErrors(fieldsToValidate);
                return;
            }
        }

        try {
            setIsLoading(true);

            const dynamicUrl = {
                add: CREATE_NEW_FOLDER_URL,
                rename: RENAME_FOLDER_URL,
                delete: DELETE_FILE_URL,
            };

            if (modalType === "delete") {
                const actions = dynamicActions(dynamicUrl[modalType], formData, fileData?.fileId, apiServices, "");
                const response = await actions.delete();
                if (response?.message === "Successful") {
                    fetchFolders?.();
                    folderRefetch?.();
                    onClose();
                }
            } else {
                // ⏫ Send files to crop (or upload)
                onFileSelected(
                    {
                        ...formData,
                        File: fileInputRef.current,
                    },
                    "crop"
                );
                onClose();
            }

            // Reset form
            resetForm(initialData, setFormData, setFieldErrors);
            fileInputRef.current = [];
        } catch (error) {
            console.error('File deletion error:', error);
            // Show error message to user
            alert(`Error ${modalType === 'delete' ? 'deleting' : 'processing'} file: ${error.message || 'Unknown error occurred'}`);
        } finally {
            setIsLoading(false);
        }
    };

    return (
        <CustomModal
            isOpen={isOpen}
            modalName={modalNames[modalType]}
            close={onClose}
            animationDirection="top"
            position="top"
            form={true}
            onSubmit={handleSubmit}
            isButtonLoading={isLoading}
            buttonType={"submit"}
            buttonIcon={buttonIcons[modalType]}
            buttonLabel={toPascalCase(buttonLabels[modalType])}
            isButtonDisabled={isLoading}
            buttonWidth={"100%"}
            buttonBackgroundColor={""}
            buttonTextColor={"var(--theme-font-color)"}
            buttonShape={"pill"}
            buttonBorderStyle={""}
            buttonBorderColor={"2px solid var(--theme-font-color)"}
            buttonIconStyle={{ color: "var(--theme-font-color)" }}
            buttonLabelStyle={{ fontWeight: "500" }}
            closeOnOverlayClick={false}
        >
            {modalType === "delete" ? (
                <DeleteModal text="folder" value={""} onChange={""} error={""} helperText={""} />
            ) : (
                <>
                    <CustomInput
                        className="input-style"
                        label="File Name"
                        labelPosition="top-left"
                        name="FileName"
                        type="text"
                        placeholder="File Name"
                        value={formData.FileName}
                        onChange={(e) => handleInputChange(e, setFormData, setFieldErrors, "input", "File Name")}
                        error={fieldErrors.FileName}
                        disabled={isLoading}
                    />

                    <CustomInput
                        className="input-style"
                        label="File"
                        labelPosition="top-left"
                        name="File"
                        type="file"
                        placeholder="Upload Images or PDFs"
                        onChange={handleFileChange}
                        disabled={isLoading}
                        error={fieldErrors.File}
                        multiple={true}
                        accept="image/jpeg,image/jpg,image/png,image/gif,image/webp,application/pdf"
                    />
                </>
            )}
        </CustomModal>
    );
};

export default FileManagementModal;
