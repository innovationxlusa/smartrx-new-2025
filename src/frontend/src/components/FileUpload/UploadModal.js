// import { useState, useRef, useEffect } from "react";
// import "./UploadModal.css";
// import Webcam from "react-webcam";
// import { cropWhiteSpace } from "../../utils/utils";
// import { validateField } from "../../utils/validators";
// import CustomInput from "../static/Commons/CustomInput";
// import useFormHandler from "../../hooks/useFormHandler";
// import CustomButton from "../static/Commons/CustomButton";
// import CustomModal from "../static/CustomModal/CustomModal";
// import { ReactComponent as Camera } from "../../assets/img/Capture.svg";
// import { ReactComponent as ScanIcon } from "../../assets/img/ScanIcon.svg";
// import { ReactComponent as FileUpload } from "../../assets/img/FileUpload.svg";
// import { ReactComponent as FolderSmall } from "../../assets/img/FolderSmall.svg";

// // Constants for PDF-like dimensions (A4 at 72 DPI)
// const PDF_WIDTH = 656;
// const PDF_HEIGHT = 850;

// const UploadModal = ({ isOpen, onClose, showCamera, setShowCamera, onFileSelected }) => {
//     const { handleInputChange, resetForm } = useFormHandler();

//     const initialData = {
//         FileName: "",
//         File: [],
//         Webcam: true,
//     };

//     // State to manage form data
//     const [formData, setFormData] = useState(initialData);

//     // State to manage individual field errors
//     const [fieldErrors, setFieldErrors] = useState(initialData);

//     // State to manage loading status
//     const [isLoading, setIsLoading] = useState(false);

//     const webcamRef = useRef(null);

//     const videoConstraints = {
//         width: { ideal: 1280 },
//         height: { ideal: 720 },
//         facingMode: "environment",
//     };

//     const handleCaptureClick = () => {
//         setShowCamera(true);
//     };

//     const resizeImage = (imageSrc, width, height) => {
//         return new Promise((resolve) => {
//             const img = new Image();
//             img.onload = () => {
//                 const canvas = document.createElement("canvas");
//                 canvas.width = width;
//                 canvas.height = height;
//                 const ctx = canvas.getContext("2d");
//                 ctx.drawImage(img, 0, 0, width, height);
//                 resolve(canvas.toDataURL("image/jpeg"));
//             };
//             img.src = imageSrc;
//         });
//     };

//     // Effect to initialize form data based on modal type and topic(passed props)
//     useEffect(() => {
//         if (!isOpen) {
//             setShowCamera(false);

//             // Clear form data if modalType is not 'edit' and Clear empty field error on close modal
//             resetForm(initialData, setFormData, setFieldErrors);
//         }
//     }, [isOpen]);

//     const handleSaveCapture = async () => {
//         const fieldsToValidate = {
//             FileName: validateField("FileName", formData.FileName, "File name"),
//         };
//         // Validate all fields before submission
//         if (Object.values(fieldsToValidate).some((error) => error !== "")) {
//             setFieldErrors(fieldsToValidate);
//             return;
//         }

//         const imageSrc = webcamRef.current.getScreenshot();
//         if (imageSrc) {
//             try {
//                 setIsLoading(true);

//                 const resizedImage = await resizeImage(imageSrc, PDF_WIDTH, PDF_HEIGHT);
//                 const res = await fetch(resizedImage);
//                 const blob = await res.blob();

//                 formData.File = [
//                     new File([blob], "captured-image.jpg", {
//                         type: "image/jpeg",
//                         lastModified: Date.now(),
//                     }),
//                 ];

//                 onFileSelected(formData, "crop");
//                 setShowCamera(false);
//                 onClose();
//                 resetForm(initialData, setFormData, setFieldErrors);
//             } catch (error) {
//                 console.error("Failed to save capture:", error);
//             } finally {
//                 setIsLoading(false); // Reset loading state
//             }
//         } else {
//             console.log("Image source is null");
//         }
//     };

//     const handleCloseCamera = () => {
//         setShowCamera(false);
//     };

//     const handleUploadClick = () => {
//         document.getElementById("fileInput").click();
//     };

//     const handleFileChange = (e) => {
//         const selectedFile = e.target.files[0];
//         if (selectedFile) {
//             onFileSelected(selectedFile, "crop");
//             onClose();
//         }
//     };

//     const listItems = [
//         { label: "New Folder", icon: <FolderSmall className="upload-icon" />, onClick: () => onFileSelected({}, "add") },
//         { label: "Capture", icon: <Camera className="upload-icon" />, onClick: handleCaptureClick },
//         { label: "Files Upload", icon: <FileUpload className="upload-icon" />, onClick: () => onFileSelected({}, "upload file") },
//         { label: "Scan", icon: <ScanIcon className="upload-icon" />, onClick: handleUploadClick },
//     ];

//     return (
//         <CustomModal isOpen={isOpen} modalName="" close={onClose} animationDirection="bottom" position="bottom" closeOnOverlayClick={false}>
//             <div className="upload-modal-container">
//                 {!showCamera ? (
//                     <>
//                         <div className="upload-section">
//                             <h5 className="primary-tab-title text-start">CREATE</h5>
//                             <div className="upload-list">
//                                 <div className="upload-item" onClick={listItems[0].onClick}>
//                                     <div className="upload-icon-container">{listItems[0].icon}</div>
//                                     <span className="upload-label">{listItems[0].label}</span>
//                                 </div>
//                             </div>
//                         </div>

//                         <div className="upload-section">
//                             <h5 className="primary-tab-title text-start">IMPORT</h5>
//                             <div className="upload-list">
//                                 {listItems.slice(1).map((item, index) => (
//                                     <div key={index} className="upload-item" onClick={item.onClick}>
//                                         <div className="upload-icon-container">{item.icon}</div>
//                                         <span className="upload-label">{item.label}</span>
//                                     </div>
//                                 ))}
//                             </div>
//                         </div>
//                     </>
//                 ) : (
//                     <>
//                         <CustomInput
//                             className="input-style"
//                             label="File Name"
//                             labelPosition="top-left"
//                             name="FileName"
//                             type="text"
//                             placeholder="File Name"
//                             value={formData.FileName}
//                             onChange={(e) => handleInputChange(e, setFormData, setFieldErrors, "input", "File name")}
//                             error={fieldErrors.FileName}
//                             disabled={isLoading}
//                         />
//                         <Webcam audio={false} ref={webcamRef} screenshotFormat="image/jpeg" videoConstraints={videoConstraints} width="100%" height="350px" className="camera-video" mirrored={false} />
//                         <div className="camera-controls">
//                             <CustomButton
//                                 isLoading={false}
//                                 type="button"
//                                 icon=""
//                                 label="Cancel"
//                                 onClick={handleCloseCamera}
//                                 disabled={false}
//                                 width="100%"
//                                 backgroundColor=""
//                                 textColor="var(--theme-font-color)"
//                                 shape="roundedSquare"
//                                 borderStyle=""
//                                 borderColor="1px solid var(--theme-font-color)"
//                                 iconStyle={{ color: "var(--theme-font-color)" }}
//                                 labelStyle={{
//                                     fontSize: "16px",
//                                     fontWeight: "400",
//                                     fontFamily: "Source Sans Pro",
//                                     textTransform: "capitalize",
//                                 }}
//                                 hoverEffect="theme"
//                             />
//                             <CustomButton
//                                 isLoading={false}
//                                 type="button"
//                                 icon=""
//                                 label="Save"
//                                 onClick={handleSaveCapture}
//                                 disabled={false}
//                                 width="100%"
//                                 backgroundColor=""
//                                 textColor="var(--theme-font-color)"
//                                 shape="roundedSquare"
//                                 borderStyle=""
//                                 borderColor="1px solid var(--theme-font-color)"
//                                 iconStyle={{ color: "var(--theme-font-color)" }}
//                                 labelStyle={{
//                                     fontSize: "16px",
//                                     fontWeight: "400",
//                                     fontFamily: "Source Sans Pro",
//                                     textTransform: "capitalize",
//                                 }}
//                                 hoverEffect="theme"
//                             />
//                         </div>
//                     </>
//                 )}

//                 <input id="fileInput" type="file" style={{ display: "none" }} onChange={handleFileChange} accept="image/*,.pdf" />
//             </div>
//         </CustomModal>
//     );
// };

// export default UploadModal;

// import { useState, useRef, useEffect } from "react";
// import "./UploadModal.css";
// import Webcam from "react-webcam";
// import { validateField } from "../../utils/validators";
// import CustomInput from "../static/Commons/CustomInput";
// import useFormHandler from "../../hooks/useFormHandler";
// import CustomButton from "../static/Commons/CustomButton";
// import CustomModal from "../static/CustomModal/CustomModal";
// import { ReactComponent as Camera } from "../../assets/img/Capture.svg";
// import { ReactComponent as ScanIcon } from "../../assets/img/ScanIcon.svg";
// import { ReactComponent as FileUpload } from "../../assets/img/FileUpload.svg";
// import { ReactComponent as FolderSmall } from "../../assets/img/FolderSmall.svg";

// // Constants for PDF-like dimensions (A4 at 72 DPI)
// const PDF_WIDTH = 656;
// const PDF_HEIGHT = 850;

// const UploadModal = ({ isOpen, onClose, showCamera, setShowCamera, onFileSelected }) => {
//     const { handleInputChange, resetForm } = useFormHandler();
//     const initialData = { FileName: "", File: [], Webcam: true };

//     const [formData, setFormData] = useState(initialData);
//     const [fieldErrors, setFieldErrors] = useState(initialData);
//     const [isLoading, setIsLoading] = useState(false);
//     const [capturedImages, setCapturedImages] = useState([]);
//     const [selectedIndex, setSelectedIndex] = useState(0);

//     const webcamRef = useRef(null);
//     const thumbScrollRef = useRef(null);

//     const videoConstraints = {
//         width: { ideal: 1280 },
//         height: { ideal: 720 },
//         facingMode: "environment",
//     };

//     useEffect(() => {
//         if (!isOpen) {
//             setShowCamera(false);
//             resetForm(initialData, setFormData, setFieldErrors);
//             setCapturedImages([]);
//             setSelectedIndex(0);
//         }
//     }, [isOpen]);

//     useEffect(() => {
//         if (thumbScrollRef.current) {
//             thumbScrollRef.current.scrollTo({
//                 left: thumbScrollRef.current.scrollWidth,
//                 behavior: "smooth",
//             });
//         }
//     }, [capturedImages]);

//     const resizeImage = (imageSrc, width, height) => {
//         return new Promise((resolve) => {
//             const img = new Image();
//             img.onload = () => {
//                 const canvas = document.createElement("canvas");
//                 canvas.width = width;
//                 canvas.height = height;
//                 const ctx = canvas.getContext("2d");
//                 ctx.drawImage(img, 0, 0, width, height);
//                 resolve(canvas.toDataURL("image/jpeg"));
//             };
//             img.src = imageSrc;
//         });
//     };

//     const handleCaptureClick = () => {
//         setShowCamera(true);
//     };

//     const captureImage = async () => {
//         const imageSrc = webcamRef.current.getScreenshot();
//         if (imageSrc) {
//             const resized = await resizeImage(imageSrc, PDF_WIDTH, PDF_HEIGHT);
//             // setCapturedImages((prev) => [...prev, resized]);

//             setCapturedImages((prev) => {
//                 const updated = [...prev, resized];
//                 setSelectedIndex(updated.length - 1);
//                 return updated;
//             });

//             setSelectedIndex(capturedImages.length); // move to new image
//         }
//     };

//     const handleDeleteImage = (index) => {
//         const newImages = capturedImages.filter((_, i) => i !== index);
//         setCapturedImages(newImages);
//         setSelectedIndex((prev) => Math.max(0, prev - (index === prev ? 1 : 0)));
//     };

//     const handleSaveAllCaptures = async () => {
//         const fieldsToValidate = {
//             FileName: validateField("FileName", formData.FileName, "File name"),
//         };
//         if (Object.values(fieldsToValidate).some((error) => error !== "")) {
//             setFieldErrors(fieldsToValidate);
//             return;
//         }

//         try {
//             setIsLoading(true);
//             const imageFiles = await Promise.all(
//                 capturedImages.map(async (img, i) => {
//                     const blob = await fetch(img).then((res) => res.blob());
//                     return new File([blob], `${formData.FileName || "captured"}-${i + 1}.jpg`, {
//                         type: "image/jpeg",
//                         lastModified: Date.now(),
//                     });
//                 })
//             );

//             onFileSelected({ ...formData, File: imageFiles }, "crop");
//             onClose();
//         } catch (error) {
//             console.error("Save error:", error);
//         } finally {
//             setIsLoading(false);
//         }
//     };

//     const handleUploadClick = () => {
//         document.getElementById("fileInput").click();
//     };

//     const handleFileChange = (e) => {
//         const selectedFile = e.target.files[0];
//         if (selectedFile) {
//             onFileSelected(selectedFile, "crop");
//             onClose();
//         }
//     };

//     const listItems = [
//         { label: "New Folder", icon: <FolderSmall className="upload-icon" />, onClick: () => onFileSelected({}, "add") },
//         { label: "Capture", icon: <Camera className="upload-icon" />, onClick: handleCaptureClick },
//         { label: "Files Upload", icon: <FileUpload className="upload-icon" />, onClick: () => onFileSelected({}, "upload file") },
//         { label: "Scan", icon: <ScanIcon className="upload-icon" />, onClick: handleUploadClick },
//     ];

//     return (
//         <CustomModal isOpen={isOpen} close={onClose} animationDirection="bottom" position="bottom" closeOnOverlayClick={false}>
//             <div className="upload-modal-container">
//                 {!showCamera ? (
//                     <>
//                         <div className="upload-section">
//                             <h5 className="primary-tab-title text-start">CREATE</h5>
//                             <div className="upload-list">
//                                 <div className="upload-item" onClick={listItems[0].onClick}>
//                                     <div className="upload-icon-container">{listItems[0].icon}</div>
//                                     <span className="upload-label">{listItems[0].label}</span>
//                                 </div>
//                             </div>
//                         </div>
//                         <div className="upload-section">
//                             <h5 className="primary-tab-title text-start">IMPORT</h5>
//                             <div className="upload-list">
//                                 {listItems.slice(1).map((item, index) => (
//                                     <div key={index} className="upload-item" onClick={item.onClick}>
//                                         <div className="upload-icon-container">{item.icon}</div>
//                                         <span className="upload-label">{item.label}</span>
//                                     </div>
//                                 ))}
//                             </div>
//                         </div>
//                     </>
//                 ) : (
//                     <>
//                         <CustomInput
//                             label="File Name"
//                             labelPosition="top-left"
//                             name="FileName"
//                             type="text"
//                             placeholder="File Name"
//                             value={formData.FileName}
//                             onChange={(e) => handleInputChange(e, setFormData, setFieldErrors, "input", "File name")}
//                             error={fieldErrors.FileName}
//                             disabled={isLoading}
//                         />
//                         <Webcam audio={false} ref={webcamRef} screenshotFormat="image/jpeg" videoConstraints={videoConstraints} className="camera-video" mirrored={false} />
//                         <div className="camera-controls">
//                             <CustomButton label="Capture" onClick={captureImage} disabled={isLoading} />
//                             <CustomButton label="Cancel" onClick={() => setShowCamera(false)} disabled={isLoading} />
//                         </div>
//                         {/* {capturedImages.length > 0 && (
//                             <div className="image-carousel">
//                                 {capturedImages.map((img, idx) => (
//                                     <div key={idx} className={`carousel-thumb ${selectedIndex === idx ? "active" : ""}`} onClick={() => setSelectedIndex(idx)}>
//                                         <img src={img} alt={`capture-${idx}`} />
//                                         <button className="delete-thumb" onClick={() => handleDeleteImage(idx)}>
//                                             ×
//                                         </button>
//                                     </div>
//                                 ))}
//                                 <div className="carousel-main">
//                                     <img src={capturedImages[selectedIndex]} alt="Selected" />
//                                 </div>
//                                 <CustomButton label="Save All" onClick={handleSaveAllCaptures} isLoading={isLoading} />
//                             </div>
//                         )} */}

//                         <div className="image-carousel">
//                             <div className="carousel-thumbnails" ref={thumbScrollRef}>
//                                 {capturedImages.map((img, idx) => (
//                                     <div key={idx} className={`carousel-thumb ${selectedIndex === idx ? "active" : ""}`} onClick={() => setSelectedIndex(idx)}>
//                                         <img src={img} alt={`capture-${idx}`} />
//                                         <button
//                                             className="delete-thumb"
//                                             onClick={(e) => {
//                                                 e.stopPropagation();
//                                                 handleDeleteImage(idx);
//                                             }}
//                                         >
//                                             ×
//                                         </button>
//                                     </div>
//                                 ))}
//                             </div>

//                             <div className="carousel-main">{capturedImages[selectedIndex] && <img src={capturedImages[selectedIndex]} alt="Selected" />}</div>

//                             <CustomButton label="Save All" onClick={handleSaveAllCaptures} isLoading={isLoading} />
//                         </div>
//                     </>
//                 )}
//                 <input id="fileInput" type="file" style={{ display: "none" }} onChange={handleFileChange} accept="image/*,.pdf" />
//             </div>
//         </CustomModal>
//     );
// };

// export default UploadModal;

import { useState, useRef, useEffect } from "react";
import "./UploadModal.css";
import Webcam from "react-webcam";
import { FaPlus } from "react-icons/fa6";
import { IoClose } from "react-icons/io5";
import { Spinner } from "react-bootstrap";
import { validateField } from "../../utils/validators";
import CustomInput from "../static/Commons/CustomInput";
import useFormHandler from "../../hooks/useFormHandler";
import CustomButton from "../static/Commons/CustomButton";
import CustomModal from "../static/CustomModal/CustomModal";
import { useUserContext } from "../../contexts/UserContext";
import { ReactComponent as Camera } from "../../assets/img/Capture.svg";
import { ReactComponent as ScanIcon } from "../../assets/img/ScanIcon.svg";
import { ReactComponent as FileUpload } from "../../assets/img/FileUpload.svg";
import { ReactComponent as FolderSmall } from "../../assets/img/FolderSmall.svg";

// Constants for PDF-like dimensions (A4 at 72 DPI)
const PDF_WIDTH = 656;
const PDF_HEIGHT = 850;

const UploadModal = ({ isOpen, onClose, showCamera, setShowCamera, onFileSelected }) => {
    const { handleInputChange, resetForm } = useFormHandler();
    const { user } = useUserContext();

    const initialData = {
        FileName: "",
        File: [],
        Webcam: true,
        FolderId: user?.PrimaryFolderId,
    };

    // State to manage form data
    const [formData, setFormData] = useState(initialData);

    // State to manage individual field errors
    const [fieldErrors, setFieldErrors] = useState(initialData);

    // State to manage loading status
    const [isLoading, setIsLoading] = useState(false);
    const [isWebcamLoading, setIsWebcamLoading] = useState(false);
    const [capturedImages, setCapturedImages] = useState([]);
    const [selectedIndex, setSelectedIndex] = useState(0);

    const webcamRef = useRef(null);
    const thumbScrollRef = useRef(null);

    const videoConstraints = {
        width: { ideal: 1280 },
        height: { ideal: 960 },
        facingMode: "environment",
        aspectRatio: 4 / 3, // Added to maintain aspect ratio
    };

    useEffect(() => {
        if (!isOpen) {
            setShowCamera(false);
            resetForm(initialData, setFormData, setFieldErrors);
            setCapturedImages([]);
            setSelectedIndex(0);
        }
    }, [isOpen]);

    useEffect(() => {
        if (thumbScrollRef.current) {
            thumbScrollRef.current.scrollTo({
                left: thumbScrollRef.current.scrollWidth,
                behavior: "smooth",
            });
        }
    }, [capturedImages]);

    // useEffect(() => {
    //     if (thumbScrollRef.current) {
    //         // Scroll to the start instead of the end
    //         thumbScrollRef.current.scrollTo({
    //             left: 0,
    //             behavior: "smooth",
    //         });
    //     }
    // }, [capturedImages]);

    const resizeImage = (imageSrc, width, height) => {
        return new Promise((resolve) => {
            const img = new Image();
            img.onload = () => {
                const canvas = document.createElement("canvas");
                canvas.width = width;
                canvas.height = height;
                const ctx = canvas.getContext("2d");
                ctx.drawImage(img, 0, 0, width, height);
                resolve(canvas.toDataURL("image/jpeg"));
            };
            img.src = imageSrc;
        });
    };

    const handleCaptureClick = () => {
        setShowCamera(true);
        setIsWebcamLoading(true);
    };

    const captureImage = async () => {
        const imageSrc = webcamRef.current.getScreenshot();
        if (imageSrc) {
            const resized = await resizeImage(imageSrc, PDF_WIDTH, PDF_HEIGHT);
            setCapturedImages((prev) => {
                const updated = [...prev, resized];
                setSelectedIndex(updated.length - 1);
                return updated;
            });
            setShowCamera(false); // Close camera after capture
        }
    };

    const handleAddMoreClick = () => {
        setShowCamera(true);
        setIsWebcamLoading(true);
    };

    const handleDeleteImage = (index) => {
        const newImages = capturedImages.filter((_, i) => i !== index);
        setCapturedImages(newImages);
        setSelectedIndex((prev) => {
            if (prev === index) return Math.max(0, prev - 1);
            if (prev > index) return prev - 1;
            return prev;
        });
    };

    const handleSaveAllCaptures = async () => {
        const fieldsToValidate = {
            FileName: validateField("FileName", formData.FileName, "File name"),
        };
        if (Object.values(fieldsToValidate).some((error) => error !== "")) {
            setFieldErrors(fieldsToValidate);
            return;
        }

        try {
            setIsLoading(true);
            const imageFiles = await Promise.all(
                capturedImages.map(async (img, i) => {
                    const blob = await fetch(img).then((res) => res.blob());
                    return new File([blob], `${formData.FileName || "captured"}-${i + 1}.jpg`, {
                        type: "image/jpeg",
                        lastModified: Date.now(),
                    });
                })
            );

            onFileSelected({ ...formData, File: imageFiles }, "crop");
            onClose();
            resetForm(initialData, setFormData, setFieldErrors);
        } catch (error) {
            console.error("Save error:", error);
        } finally {
            setIsLoading(false);
        }
    };

    const handleCloseCamera = () => {
        setShowCamera(false);
    };

    const handleUploadClick = () => {
        document.getElementById("fileInput").click();
    };

    const handleFileChange = (e) => {
        const selectedFile = e.target.files[0];
        if (selectedFile) {
            onFileSelected(selectedFile, "crop");
            onClose();
        }
    };

    const listItems = [
        { label: "New Folder", icon: <FolderSmall className="upload-icon" />, onClick: () => onFileSelected({}, "add") },
        { label: "Capture", icon: <Camera className="upload-icon" />, onClick: handleCaptureClick },
        { label: "Files Upload", icon: <FileUpload className="upload-icon" />, onClick: () => onFileSelected({}, "upload file") },
        { label: "Scan", icon: <ScanIcon className="upload-icon" />, onClick: handleUploadClick },
    ];

    return (
        <CustomModal isOpen={isOpen} close={onClose} animationDirection="bottom" position="bottom" closeOnOverlayClick={false}>
            <div className="upload-modal-container">
                {!showCamera ? (
                    <>
                        {capturedImages.length === 0 ? (
                            <>
                                <div className="upload-section">
                                    <h5 className="primary-tab-title text-start">CREATE</h5>
                                    <div className="upload-list">
                                        <div className="upload-item" onClick={listItems[0].onClick}>
                                            <div className="upload-icon-container">{listItems[0].icon}</div>
                                            <span className="upload-label">{listItems[0].label}</span>
                                        </div>
                                    </div>
                                </div>
                                <div className="upload-section">
                                    <h5 className="primary-tab-title text-start">IMPORT</h5>
                                    <div className="upload-list">
                                        {listItems.slice(1).map((item, index) => (
                                            <div key={index} className="upload-item" onClick={item.onClick}>
                                                <div className="upload-icon-container">{item.icon}</div>
                                                <span className="upload-label">{item.label}</span>
                                            </div>
                                        ))}
                                    </div>
                                </div>
                            </>
                        ) : (
                            <div className="image-carousel">
                                <CustomInput
                                    className="input-style"
                                    label="File Name"
                                    labelPosition="top-left"
                                    name="FileName"
                                    type="text"
                                    placeholder="File Name"
                                    value={formData.FileName}
                                    onChange={(e) => handleInputChange(e, setFormData, setFieldErrors, "input", "File name")}
                                    error={fieldErrors.FileName}
                                    disabled={isLoading}
                                />

                                <div className="carousel-main">{capturedImages[selectedIndex] && <img src={capturedImages[selectedIndex]} alt="Selected image" />}</div>

                                <div className="carousel-thumbnails" ref={thumbScrollRef}>
                                    {capturedImages.map((img, idx) => (
                                        <div key={idx} className={`carousel-thumb ${selectedIndex === idx ? "active" : ""}`} onClick={() => setSelectedIndex(idx)}>
                                            <img src={img} className="img-fluid" alt={`capture-${idx}`} />
                                            <div
                                                className="delete-thumb"
                                                onClick={(e) => {
                                                    e.stopPropagation();
                                                    handleDeleteImage(idx);
                                                }}
                                            >
                                                <IoClose />
                                            </div>
                                        </div>
                                    ))}
                                    <div className="carousel-thumb add-more" onClick={handleAddMoreClick}>
                                        <FaPlus className="plus-icon" />
                                    </div>
                                </div>

                                <div className="camera-controls">
                                    <CustomButton
                                        isLoading={isLoading || isWebcamLoading}
                                        type="button"
                                        icon=""
                                        label="Cancel"
                                        onClick={handleCloseCamera}
                                        disabled=""
                                        width="100px"
                                        backgroundColor=""
                                        textColor="var(--theme-font-color)"
                                        shape="roundedSquare"
                                        borderStyle=""
                                        borderColor="1px solid var(--theme-font-color)"
                                        iconStyle={{ color: "var(--theme-font-color)" }}
                                        labelStyle={{
                                            fontSize: "16px",
                                            fontWeight: "400",
                                            fontFamily: "Source Sans Pro",
                                            textTransform: "capitalize",
                                        }}
                                        hoverEffect="theme"
                                    />
                                    <CustomButton
                                        isLoading={isLoading || isWebcamLoading}
                                        type="button"
                                        icon=""
                                        label="Save"
                                        onClick={handleSaveAllCaptures}
                                        disabled={isLoading || isWebcamLoading}
                                        width="100px"
                                        backgroundColor=""
                                        textColor="var(--theme-font-color)"
                                        shape="roundedSquare"
                                        borderStyle=""
                                        borderColor="1px solid var(--theme-font-color)"
                                        iconStyle={{ color: "var(--theme-font-color)" }}
                                        labelStyle={{
                                            fontSize: "16px",
                                            fontWeight: "400",
                                            fontFamily: "Source Sans Pro",
                                            textTransform: "capitalize",
                                        }}
                                        hoverEffect="theme"
                                    />
                                </div>
                            </div>
                        )}
                    </>
                ) : (
                    <>
                        <div className="camera-container">
                            {isWebcamLoading && (
                                <div className="h-100 d-flex align-items-center flex-column justify-content-center" style={{ height: "140px" }}>
                                    <Spinner color="inherit" animation="border" size="sm" />
                                    <p>Loading camera...</p>
                                </div>
                            )}

                            <Webcam
                                audio={false}
                                ref={webcamRef}
                                screenshotFormat="image/jpeg"
                                videoConstraints={videoConstraints}
                                className="camera-video"
                                mirrored={false}
                                onUserMedia={() => setIsWebcamLoading(false)}
                                onUserMediaError={() => {
                                    setIsWebcamLoading(false);
                                    // I might want to handle errors here
                                }}
                            />
                        </div>
                        <div className="camera-controls">
                            <CustomButton
                                isLoading={isLoading}
                                type="button"
                                icon=""
                                label="Cancel"
                                onClick={() => {
                                    if (capturedImages.length > 0) {
                                        setShowCamera(false);
                                    } else {
                                        onClose();
                                    }
                                }}
                                disabled={isLoading || isWebcamLoading}
                                width="100%"
                                backgroundColor=""
                                textColor="var(--theme-font-color)"
                                shape="roundedSquare"
                                borderStyle=""
                                borderColor="1px solid var(--theme-font-color)"
                                iconStyle={{ color: "var(--theme-font-color)" }}
                                labelStyle={{
                                    fontSize: "16px",
                                    fontWeight: "400",
                                    fontFamily: "Source Sans Pro",
                                    textTransform: "capitalize",
                                }}
                                hoverEffect="theme"
                            />
                            <CustomButton
                                isLoading={isLoading}
                                type="button"
                                icon=""
                                label="Capture"
                                onClick={captureImage}
                                disabled={isLoading || isWebcamLoading}
                                width="100%"
                                backgroundColor=""
                                textColor="var(--theme-font-color)"
                                shape="roundedSquare"
                                borderStyle=""
                                borderColor="1px solid var(--theme-font-color)"
                                iconStyle={{ color: "var(--theme-font-color)" }}
                                labelStyle={{
                                    fontSize: "16px",
                                    fontWeight: "400",
                                    fontFamily: "Source Sans Pro",
                                    textTransform: "capitalize",
                                }}
                                hoverEffect="theme"
                            />
                        </div>
                    </>
                )}
                <input id="fileInput" type="file" style={{ display: "none" }} onChange={handleFileChange} accept="image/*,.pdf" />
            </div>
        </CustomModal>
    );
};

export default UploadModal;
