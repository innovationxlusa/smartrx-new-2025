// import { useState, useCallback, useEffect } from "react";
// import "./CropModal.css";
// import Cropper from "react-easy-crop";
// import getCroppedImg from "../../utils/utils";
// import { useNavigate } from "react-router-dom";
// import CustomSlider from "../CustomSlider/CustomSlider";
// import useApiClients from "../../services/useApiClients";
// import CustomButton from "../static/Commons/CustomButton";
// import CustomModal from "../static/CustomModal/CustomModal";
// import { useUserContext } from "../../contexts/UserContext";
// import { usePreviewContext } from "../../contexts/PreviewContext";
// import PDFViewer from "../PDFViewer/PDFViewer";
// import { IoIosArrowDropleft, IoIosArrowDropright } from "react-icons/io";

// const CropModal = ({ isOpen, onClose, files, folderData, onCropDone }) => {
//     const navigate = useNavigate();

//     const [crop, setCrop] = useState({ x: 0, y: 0 });
//     const [zoom, setZoom] = useState(1);
//     const [rotation, setRotation] = useState(0);
//     const [brightness, setBrightness] = useState(100);
//     const [contrast, setContrast] = useState(100);
//     const [extraFilter, setExtraFilter] = useState("");
//     const [aspect, setAspect] = useState(1);
//     const [croppedAreaPixels, setCroppedAreaPixels] = useState(null);
//     const { user } = useUserContext();
//     const { setPreviewData } = usePreviewContext();

//     // State to manage loading status
//     const [isLoading, setIsLoading] = useState(false);
//     const [isReTakeLoading, setIsReTakeLoading] = useState(false);

//     // Initial form data structure
//     const initialData = {
//         File: null,
//         FileName: "",
//         FolderName: "",
//         UniqueFileId: "",
//         InsertedBy: "",
//         FilePath: "",
//         SeqNo: "",
//         FolderId: "",
//         FolderHierarchy: "",
//         UserId: Number(user?.jti),
//     };

//     // State to manage form data
//     const [formData, setFormData] = useState(initialData);

//     // State to track field-level errors for form validation
//     const [fieldErrors, setFieldErrors] = useState(initialData);

//     // Destructuring API service methods
//     const { api } = useApiClients();

//     const isImageFile = (file?.File ? file.File : file) && (file?.File ? file.File : file)?.type?.startsWith("image/");
//     const isPdfFile = (file?.File ? file.File : file) && (file?.File ? file.File : file)?.type === "application/pdf";

//     useEffect(() => {
//         if (!isOpen) {
//             resetAllSettings();
//         }
//     }, [isOpen]);

//     const onCropComplete = useCallback((croppedArea, croppedAreaPixels) => {
//         setCroppedAreaPixels(croppedAreaPixels);
//     }, []);

//     const resetAllSettings = () => {
//         setCrop({ x: 0, y: 0 });
//         setZoom(1);
//         setRotation(0);
//         setBrightness(100);
//         setContrast(100);
//         setExtraFilter("");
//         setAspect(1);
//         setCroppedAreaPixels(null);
//     };

//     const handleCrop = useCallback(async () => {
//         if (!file || !croppedAreaPixels) return;

//         try {
//             const croppedImgBlob = await getCroppedImg(URL.createObjectURL(file), croppedAreaPixels, rotation);
//             const croppedImageURL = URL.createObjectURL(croppedImgBlob);
//             onCropDone(croppedImageURL); // sending cropped image back
//             onClose(); // close modal after crop done
//         } catch (e) {
//             console.error(e);
//         }
//     }, [croppedAreaPixels, rotation, file, onCropDone, onClose]);

//     if (!(file?.File ? file.File : file)) return null;

//     const handleSave = async (e) => {
//         e.preventDefault(); // Prevent form default submission

//         if (!(file?.File ? file.File : file)) return;

//         try {
//             setIsLoading(true);

//             const newData = {
//                 ...formData,
//                 File: file?.File ? file.File : file,
//                 FileName: file?.File ? file.FileName : "",
//                 InsertedBy: Number(user?.jti),
//                 LoginUserId: Number(user?.jti),
//                 FolderId: folderData?.folderId,
//                 FolderHierarchy: folderData?.folderHeirarchy,
//             };

//             let fileToSend;
//             let navigationState;

//             if (isImageFile && croppedAreaPixels) {
//                 const croppedImgBlob = await getCroppedImg(URL.createObjectURL(file?.File ? file.File : file), croppedAreaPixels, rotation);
//                 fileToSend = new File([croppedImgBlob], (file?.File ? file.File : file).name, { type: (file?.File ? file.File : file).type });
//                 navigationState = { croppedImage: URL.createObjectURL(fileToSend), serverData: null, folder: folderData };
//                 navigationState = { croppedImage: URL.createObjectURL(file?.File ? file.File : file), serverData: null, folder: folderData };
//             } else if (isPdfFile) {
//                 fileToSend = file?.File ? file.File : file;
//                 navigationState = { pdfFile: URL.createObjectURL(fileToSend), serverData: null, folder: folderData };
//             } else {
//                 console.error("Unsupported file type or no crop area selected for image.");
//                 return;
//             }

//             const uploadResponse = await api.prescriptionUpload(
//                 newData,
//                 (uploadEvent) => {
//                     const progress = Math.round((uploadEvent.loaded * 100) / uploadEvent.total);
//                     console.log(`Upload: ${progress}%`);
//                 },
//                 ""
//             );

//             if (uploadResponse?.message === "Successful" || typeof uploadResponse === "object") {
//                 setPreviewData({ ...navigationState, serverData: uploadResponse.response });
//                 navigate("/preview");
//                 onClose();
//             }
//         } catch (error) {
//             console.error("Error during upload:", error);
//         } finally {
//             setIsLoading(false);
//         }
//     };

//     return (
//         <CustomModal isOpen={isOpen} close={onClose} animationDirection="top" position="top" closeOnOverlayClick={false}>
//             <div className="upload-modal-container">
//                 <div className="cropper-wrapper" style={{ position: "relative", width: "100%", height: "350px", display: "flex", justifyContent: "center", alignItems: "center", overflow: "hidden" }}>
//                     {isImageFile && (
//                         <Cropper
//                             image={URL.createObjectURL(file?.File ? file.File : file)}
//                             crop={crop}
//                             zoom={zoom}
//                             rotation={rotation}
//                             aspect={aspect}
//                             onCropChange={setCrop}
//                             onZoomChange={setZoom}
//                             onRotationChange={setRotation}
//                             onCropComplete={onCropComplete}
//                             style={{
//                                 containerStyle: {
//                                     filter: `brightness(${brightness}%) contrast(${contrast}%) ${extraFilter}`,
//                                 },
//                             }}
//                         />
//                     )}
//                     {isPdfFile && (
//                         <div className="mx-auto text-center">
//                             <p>Preview of the PDF:</p>
//                             <iframe src={URL.createObjectURL(file?.File ? file.File : file)} width="100%" height="300px" frameBorder="0"></iframe>
//                             {/* <PDFViewer file={file?.File ? file.File : file} /> */}
//                         </div>
//                     )}
//                     {!isImageFile && !isPdfFile && <p>Unsupported file type</p>}
//                 </div>

//                 {isImageFile && (
//                     <div className="editor-controls">
//                         {/* Zoom Control */}
//                         <div className="control-group">
//                             <label>Zoom</label>
//                             <CustomSlider value={zoom} min={1} max={3} step={0.1} onChange={setZoom} />
//                         </div>
//                     </div>
//                 )}

//                 {/* Action Buttons */}
//                 <div className="buttons" style={{ marginTop: "20px", display: "flex", gap: "10px" }}>
//                     <CustomButton
//                         isLoading={isReTakeLoading}
//                         type={"button"}
//                         icon={""}
//                         label={"Re-Take"}
//                         onClick={onClose} // Assuming re-take closes the modal to allow re-selection
//                         disabled={isLoading || isReTakeLoading}
//                         width={"100%"}
//                         backgroundColor={""}
//                         textColor={"var(--theme-font-color)"}
//                         shape={"roundedSquare"}
//                         borderStyle={""}
//                         borderColor={"1px solid var(--theme-font-color)"}
//                         iconStyle={{ color: "var(--theme-font-color)" }}
//                         labelStyle={{ fontSize: "16px", fontWeight: "400", fontFamily: "Source Sans Pro", textTransform: "capitalize" }}
//                         hoverEffect={"theme"}
//                     />

//                     <CustomButton
//                         isLoading={isLoading}
//                         type={"button"}
//                         icon={""}
//                         label={"Save"}
//                         onClick={handleSave}
//                         disabled={isLoading || isReTakeLoading}
//                         width={"100%"}
//                         backgroundColor={""}
//                         textColor={"var(--theme-font-color)"}
//                         shape={"roundedSquare"}
//                         borderStyle={""}
//                         borderColor={"1px solid var(--theme-font-color)"}
//                         iconStyle={{ color: "var(--theme-font-color)" }}
//                         labelStyle={{ fontSize: "16px", fontWeight: "400", fontFamily: "Source Sans Pro", textTransform: "capitalize" }}
//                         hoverEffect={"theme"}
//                     />
//                 </div>
//             </div>
//         </CustomModal>
//     );
// };

// export default CropModal;

import { useState, useCallback, useEffect } from "react";
import "./CropModal.css";
import Cropper from "react-easy-crop";
import getCroppedImg from "../../utils/utils";
import { useNavigate } from "react-router-dom";
import CustomSlider from "../CustomSlider/CustomSlider";
import useApiClients from "../../services/useApiClients";
import CustomButton from "../static/Commons/CustomButton";
import CustomModal from "../static/CustomModal/CustomModal";
import { useUserContext } from "../../contexts/UserContext";
import { usePreviewContext } from "../../contexts/PreviewContext";
import { IoIosArrowDropleft, IoIosArrowDropright } from "react-icons/io";

const CropModal = ({ isOpen, onClose, files, folderData, onCropDone, onFileSelected }) => {
    const navigate = useNavigate();

    // State for each file's crop settings
    const [currentFileIndex, setCurrentFileIndex] = useState(0);
    const [cropSettings, setCropSettings] = useState(
        files?.File?.map(() => ({
            crop: { x: 0, y: 0 },
            zoom: 1,
            rotation: 0,
            brightness: 100,
            contrast: 100,
            extraFilter: "",
            aspect: 1,
            croppedAreaPixels: null,
        })) || []
    );

    const { user } = useUserContext();
    const { setPreviewData } = usePreviewContext();

    // State to manage loading status
    const [isLoading, setIsLoading] = useState(false);
    const [isReTakeLoading, setIsReTakeLoading] = useState(false);

    // Initial form data structure
    const initialData = {
        File: null,
        FileName: "",
        FolderName: "",
        UniqueFileId: "",
        InsertedBy: "",
        FilePath: "",
        SeqNo: "",
        FolderId: "",
        FolderHierarchy: "",
        UserId: Number(user?.jti),
    };

    // State to manage form data
    const [formData, setFormData] = useState(initialData);

    // State to track field-level errors for form validation
    const [fieldErrors, setFieldErrors] = useState(initialData);

    // Destructuring API service methods
    const { api } = useApiClients();

    useEffect(() => {
        if (!isOpen) {
            resetAllSettings();
        } else {
            // Initialize crop settings when modal opens with files
            setCropSettings(
                files?.File?.map(() => ({
                    crop: { x: 0, y: 0 },
                    zoom: 1,
                    rotation: 0,
                    brightness: 100,
                    contrast: 100,
                    extraFilter: "",
                    aspect: 1,
                    croppedAreaPixels: null,
                })) || []
            );
            setCurrentFileIndex(0);
        }
    }, [isOpen, files]);

    const isImageFile = (file) => file?.type?.startsWith("image/");
    const isPdfFile = (file) => file?.type === "application/pdf";

    const onCropComplete = useCallback(
        (croppedArea, croppedAreaPixels) => {
            setCropSettings((prev) => {
                const newSettings = [...prev];
                newSettings[currentFileIndex] = {
                    ...newSettings[currentFileIndex],
                    croppedAreaPixels,
                };
                return newSettings;
            });
        },
        [currentFileIndex]
    );

    const resetAllSettings = () => {
        setCropSettings(
            files?.File?.map(() => ({
                crop: { x: 0, y: 0 },
                zoom: 1,
                rotation: 0,
                brightness: 100,
                contrast: 100,
                extraFilter: "",
                aspect: 1,
                croppedAreaPixels: null,
            })) || []
        );
        setCurrentFileIndex(0);
    };

    const handleCrop = useCallback(async () => {
        if (!files?.File || !files?.File[currentFileIndex] || !cropSettings[currentFileIndex]?.croppedAreaPixels) return;

        try {
            const currentFile = files?.File[currentFileIndex];
            const currentSettings = cropSettings[currentFileIndex];
            const croppedImgBlob = await getCroppedImg(URL.createObjectURL(currentFile), currentSettings.croppedAreaPixels, currentSettings.rotation);
            const croppedImageURL = URL.createObjectURL(croppedImgBlob);
            onCropDone(croppedImageURL); // sending cropped image back
            onClose(); // close modal after crop done
        } catch (e) {
            console.error(e);
        }
    }, [cropSettings, currentFileIndex, files, onCropDone, onClose]);

    // if (!files?.File || files?.File.length === 0) return null;

    const currentFile = files?.File && files?.File[currentFileIndex];
    const currentSettings = cropSettings[currentFileIndex] || {};

    const handleRetake = () => {
        onFileSelected({ Webcam: true }, "upload");
    };

    const handleSave = async (e) => {
        e.preventDefault();

        if (!files?.File || files?.File?.length === 0) return;

        try {
            setIsLoading(true);

            // Process all files
            const processedFiles = [];
            const navigationState = {
                croppedImages: [],
                pdfFiles: [],
                serverData: null,
                folder: folderData,
            };

            for (let i = 0; i < files?.File?.length; i++) {
                const file = files?.File[i];
                const settings = cropSettings[i];

                if (isImageFile(file)) {
                    // If cropped area exists, use the cropped version, otherwise use original
                    if (settings?.croppedAreaPixels) {
                        const croppedImgBlob = await getCroppedImg(URL.createObjectURL(file), settings.croppedAreaPixels, settings.rotation);
                        const fileToSend = new File([croppedImgBlob], file.name, { type: file.type });
                        // processedFiles.push(fileToSend);
                        processedFiles.push(file);
                        // navigationState.croppedImages.push(URL.createObjectURL(file));
                        navigationState.croppedImages.push(file);
                    } else {
                        // No crop area selected - use original image
                        processedFiles.push(file);
                        // navigationState.croppedImages.push(URL.createObjectURL(file));
                        navigationState.croppedImages.push(file);
                    }
                } else if (isPdfFile(file)) {
                   
                    processedFiles.push(file);
                    // navigationState.pdfFiles.push(URL.createObjectURL(file));
                    navigationState.pdfFiles.push(file);
                } else {
                    console.error("Unsupported file type");
                    continue; // Skip this file instead of returning, so other files can still be processed
                }
            }

            // Prepare form data for upload
            const newData = {
                files: processedFiles,
                FileName: files?.FileName,
                LoginUserId: Number(user?.jti),
                FolderId: folderData?.folderId || files?.FolderId, //|| user?.PrimaryFolderId
            };
            const formDataToSend = new FormData();
            // Append each file
            newData.files.forEach((file) => {
                formDataToSend.append("files", file);
            });
            // Append additional fields (example)
            formDataToSend.append("FolderId", newData.FolderId);
            formDataToSend.append("FileName", newData.FileName);
            formDataToSend.append("LoginUserId", newData.LoginUserId || Number(user?.jti));

            // Upload files (you'll need to modify your API service to handle multiple files)
            const uploadResponse = await api.prescriptionUpload(
                formDataToSend,
                (uploadEvent) => {
                    const progress = Math.round((uploadEvent.loaded * 100) / uploadEvent.total);
                    console.log(`Upload: ${progress}%`);
                },
                ""
            );

            if (uploadResponse?.message === "Successful" || typeof uploadResponse === "object") {
                setPreviewData({ ...navigationState, serverData: uploadResponse.response });
                navigate("/preview");
                onClose();
            }
        } catch (error) {
            console.error("Error during upload:", error);
        } finally {
            setIsLoading(false);
        }
    };

    const handleNextFile = () => {
        if (currentFileIndex < files?.File?.length - 1) {
            setCurrentFileIndex(currentFileIndex + 1);
        }
    };

    const handlePrevFile = () => {
        if (currentFileIndex > 0) {
            setCurrentFileIndex(currentFileIndex - 1);
        }
    };

    return (
        <CustomModal isOpen={isOpen} close={onClose} animationDirection="top" position="top" closeOnOverlayClick={false}>
            <div className="upload-modal-container">
              
                {/* {!isPdfFile(currentFile) && ( */}
                    <div className="file-navigation d-flex justify-content-between align-items-center">
                         
                        <button onClick={handlePrevFile} disabled={currentFileIndex === 0} style={{ padding: "5px 10px 5px 0", cursor: currentFileIndex === 0 ? "not-allowed" : "pointer" }}>
                            <IoIosArrowDropleft />
                        </button>
                        <span>
                            File {currentFileIndex + 1} of {files?.File?.length || 0}
                        </span>
                        <button
                            onClick={handleNextFile}
                            disabled={currentFileIndex === files?.File?.length - 1}
                            style={{ padding: "5px 0 5px 10px", cursor: currentFileIndex === files?.File?.length - 1 ? "not-allowed" : "pointer" }}
                        >
                            <IoIosArrowDropright />
                        </button>
                    </div>
                {/* )} */}
                <div className="cropper-wrapper" style={{ position: "relative", width: "100%", height: "460px", display: "flex", justifyContent: "center", alignItems: "center", overflow: "hidden" }}>
                    {isImageFile(currentFile) && (
                        <Cropper
                            image={URL.createObjectURL(currentFile)}
                            crop={currentSettings.crop || { x: 0, y: 0 }}
                            zoom={currentSettings.zoom || 1}
                            rotation={currentSettings.rotation || 0}
                            aspect={currentSettings.aspect || 1}
                            onCropChange={(crop) => {
                                setCropSettings((prev) => {
                                    const newSettings = [...prev];
                                    newSettings[currentFileIndex] = {
                                        ...newSettings[currentFileIndex],
                                        crop,
                                    };
                                    return newSettings;
                                });
                            }}
                            onZoomChange={(zoom) => {
                                setCropSettings((prev) => {
                                    const newSettings = [...prev];
                                    newSettings[currentFileIndex] = {
                                        ...newSettings[currentFileIndex],
                                        zoom,
                                    };
                                    return newSettings;
                                });
                            }}
                            onRotationChange={(rotation) => {
                                setCropSettings((prev) => {
                                    const newSettings = [...prev];
                                    newSettings[currentFileIndex] = {
                                        ...newSettings[currentFileIndex],
                                        rotation,
                                    };
                                    return newSettings;
                                });
                            }}
                            onCropComplete={onCropComplete}
                            style={{
                                containerStyle: {
                                    filter: `brightness(${currentSettings.brightness || 100}%) contrast(${currentSettings.contrast || 100}%) ${currentSettings.extraFilter || ""}`,
                                },
                            }}
                        />
                    )}
                    {isPdfFile(currentFile) && (
                        <>
                        
                        <div className="mx-auto text-center">
                            <p>Preview of the PDF:</p>
                            <iframe src={URL.createObjectURL(currentFile)} width="100%" height="300px" title="PDF Preview"></iframe>
                        </div>
                        </>
                    )}
                    {!isImageFile(currentFile) && !isPdfFile(currentFile) && <p>Unsupported file type</p>}
                </div>

                {isImageFile(currentFile) && (
                    <div className="editor-controls">
                        {/* Zoom Control */}
                        <div className="">
                            <label>Zoom</label>
                            <CustomSlider
                                value={currentSettings.zoom || 1}
                                min={1}
                                max={3}
                                step={0.1}
                                onChange={(zoom) => {
                                    setCropSettings((prev) => {
                                        const newSettings = [...prev];
                                        newSettings[currentFileIndex] = {
                                            ...newSettings[currentFileIndex],
                                            zoom,
                                        };
                                        return newSettings;
                                    });
                                }}
                            />
                        </div>
                        {/* Rotation Control */}
                        {/* <div className="control-group">
                            <label>Rotation</label>
                            <CustomSlider
                                value={currentSettings.rotation || 0}
                                min={0}
                                max={360}
                                step={1}
                                onChange={(rotation) => {
                                    setCropSettings((prev) => {
                                        const newSettings = [...prev];
                                        newSettings[currentFileIndex] = {
                                            ...newSettings[currentFileIndex],
                                            rotation,
                                        };
                                        return newSettings;
                                    });
                                }}
                            />
                        </div> */}
                    </div>
                )}

                {/* Action Buttons */}
                <div className="buttons" style={{ marginTop: "20px", display: "flex", gap: "10px" }}>
                    {files?.Webcam && (
                        <CustomButton
                            isLoading={isReTakeLoading}
                            type={"button"}
                            icon={""}
                            label={"Re-Take"}
                            onClick={handleRetake}
                            disabled={isLoading || isReTakeLoading}
                            width={"100%"}
                            backgroundColor={""}
                            textColor={"var(--theme-font-color)"}
                            shape={"roundedSquare"}
                            borderStyle={""}
                            borderColor={"1px solid var(--theme-font-color)"}
                            iconStyle={{ color: "var(--theme-font-color)" }}
                            labelStyle={{ fontSize: "16px", fontWeight: "400", fontFamily: "Source Sans Pro", textTransform: "capitalize" }}
                            hoverEffect={"theme"}
                        />
                    )}

                    <CustomButton
                        isLoading={isLoading}
                        type={"button"}
                        icon={""}
                        label={"Save"}
                        onClick={handleSave}
                        disabled={isLoading || isReTakeLoading}
                        width={"100%"}
                        backgroundColor={""}
                        textColor={"var(--theme-font-color)"}
                        shape={"roundedSquare"}
                        borderStyle={""}
                        borderColor={"1px solid var(--theme-font-color)"}
                        iconStyle={{ color: "var(--theme-font-color)" }}
                        labelStyle={{ fontSize: "16px", fontWeight: "400", fontFamily: "Source Sans Pro", textTransform: "capitalize" }}
                        hoverEffect={"theme"}
                    />
                </div>
            </div>
        </CustomModal>
    );
};

export default CropModal;
