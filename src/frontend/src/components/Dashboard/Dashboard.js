import React, { useState } from "react";
import "./Dashboard.css";
import CustomCarousel from "../static/CustomCarousel/CustomCarousel";
import LearnMoreAndWatchVideoButton from "../LearnMoreAndWatchVideoButton/LearnMoreAndWatchVideoButton";
import CropModal from "../FileUpload/CropModal";
import UploadModal from "../FileUpload/UploadModal";
import { useFolder } from "../../contexts/FolderContext";
import FileManagementModal from "../FileUpload/FileManagementModal";
import FolderManagementModal from "../BrowseRx/FolderManagementModal";

const Dashboard = () => {
    const [modalType, setModalType] = useState(null);
    const [selectedFile, setSelectedFile] = useState(null);
    const [showCamera, setShowCamera] = useState(false);

    const { selectedFolder, refetch } = useFolder();

    const openModal = (type) => {
        setModalType(type); // Open the modal and set the type
    };

    const closeModal = () => {
        setModalType(null); // Close the modal
    };

    const handleFileSelected = (fileData = {}, nextModalType) => {
        const files = Array.isArray(fileData.File) ? fileData.File : [fileData.File];
        if (files.length > 0 && files[0] instanceof File) {
            console.log(fileData);
            setSelectedFile(fileData); // Store entire fileData including file array
        } else {
            console.log("No valid file(s) selected");
        }

        fileData.Webcam && setShowCamera(true);

        setTimeout(() => {
            closeModal();
            setTimeout(() => {
                openModal(nextModalType);
            }, 100);
        }, 100);
    };

    const handleCropDone = (croppedBlob) => {
        // Handle crop completion if needed
        console.log("Crop done:", croppedBlob);
    };

    const handleTitleClick = () => {
        openModal("upload"); // Open upload modal when title container is clicked
    };

    return (
        <div className="dashboard-container">
            <div className="dashboard-content-wrapper">
                <CustomCarousel />
                <div className="dashboard-title-container" onClick={handleTitleClick} style={{ cursor: 'pointer' }}>
                    <h1 className="dashboard-title">Getting Started</h1>
                </div>
            </div>
            <div className="learn-more-button-container">
                <LearnMoreAndWatchVideoButton url={"/learnmore/learnAllRx"} />
            </div>
            
            {/* Upload and Crop Modals */}
            <UploadModal 
                isOpen={modalType === "upload"} 
                onClose={closeModal} 
                showCamera={showCamera} 
                setShowCamera={setShowCamera} 
                onFileSelected={handleFileSelected} 
            />
            <CropModal 
                isOpen={modalType === "crop"} 
                onClose={closeModal} 
                files={selectedFile || []} 
                folderData={selectedFolder} 
                onCropDone={handleCropDone} 
                onFileSelected={handleFileSelected} 
            />
            {/* Modal for new folder related actions */}
            <FolderManagementModal 
                modalType={modalType} 
                isOpen={modalType === "add"} 
                folderData={selectedFolder} 
                onClose={closeModal} 
                fetchFolders={refetch} 
            />
            <FileManagementModal
                modalType={modalType?.split(" ")[0]}
                isOpen={modalType === "upload file"}
                fileData={selectedFolder}
                onClose={closeModal}
                fetchFolders={refetch}
                onFileSelected={handleFileSelected}
            />
        </div>
    );
};

export default Dashboard;
