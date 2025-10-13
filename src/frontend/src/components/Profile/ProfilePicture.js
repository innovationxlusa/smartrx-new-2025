import React, { useRef, useState, useEffect, useMemo } from "react";
import ProfileEdit from "../../assets/img/ProfileEdit.svg";
import DefaultProfilePhoto from "../../assets/img/DefaultProfilePhoto.svg";

const ProfilePicture = ({ profile: profileProp, onFileSelect, size = "large", disableBackendLoading = false }) => {
    const fileInputRef = useRef(null);
    const [imageState, setImageState] = useState({
        picture: profileProp?.profilePhotoPath || profileProp?.picture || "",
        file: null,
    });

    const [loadedFile, setLoadedFile] = useState(null);
    const [profileImageUrl, setProfileImageUrl] = useState(null);
    const patientData = useMemo(() => profileProp?.data || {});

    // Function to load file from backend path
    const loadFileFromPath = async (filePath) => {
        if (!filePath) return null;
        if (disableBackendLoading) {
            return null;
        }
        try {
            // Check if it's a local asset - don't try to fetch local assets
            if (filePath.includes('/static/')) {
                return null;
            }

            const path = constructImageUrl(filePath);
            const response = await fetch(path);
            if (response.ok) {
                const blob = await response.blob();
                const fileName = filePath.split('/').pop() || 'profile-photo.jpg';
                const file = new File([blob], fileName, { type: blob.type });

                // Create URL for displaying the image
                const imageUrl = URL.createObjectURL(blob);
                setProfileImageUrl(imageUrl);
                return file;
            } else {
                console.warn(`ProfilePicture - Failed to fetch image: ${response.status} ${response.statusText} for URL: ${path}`);
            }
        } catch (error) {
            console.error("ProfilePicture - Error loading file from path:", error);
        }
        return null;
    };

    const hasImage = imageState.picture !== "" && imageState.picture.trim() !== "";
    useEffect(() => {
        if (patientData && !disableBackendLoading) {
            const loadInitialProfilePhoto = async () => {
                if (patientData?.profilePhotoPath) {
                    const profileFile = await loadFileFromPath(patientData.profilePhotoPath);
                    if (profileFile) {
                        setLoadedFile(profileFile);
                    }
                }
            };
            loadInitialProfilePhoto();
            // ... rest of initialization
        }
    }, [patientData, disableBackendLoading]);
    // Load initial profile photo from backend path
    // useEffect(() => {
    //     const loadInitialProfilePhoto = async () => {
    //         if (profileProp?.profilePhotoPath && !profileProp?.profilePhotoPath.includes('blob:')) {
    //             const profileFile = await loadFileFromPath(profileProp.profilePhotoPath);
    //             if (profileFile) {
    //                 setLoadedFile(profileFile);
    //             }
    //         }
    //     };
    //     loadInitialProfilePhoto();
    // }, [profileProp?.profilePhotoPath]);

    // Helper function to construct proper image URL
    const constructImageUrl = (path) => {

        if (!path) {
            return DefaultProfilePhoto;
        }

        // Check if it's already a full URL (starts with http/https) or a blob URL
        if (path.startsWith('http') || path.startsWith('blob:')) {
            return path;
        }

        // Check if it's a local asset (starts with /static/)
        if (path.includes('/static/')) {
            return path;
        }

        // For backend paths, construct URL with REACT_APP_IMAGE_URL
        const baseUrl = process.env.REACT_APP_IMAGE_URL || '';
        if (baseUrl) {
            const constructedUrl = `${baseUrl}/${path}`;
            return constructedUrl;
        }
        return path;
    };

    // Update image state with loaded image URL or fallback to profileProp
    useEffect(() => {
        const constructedPhotoPath = constructImageUrl(profileProp?.profilePhotoPath);
        const constructedPicture = constructImageUrl(profileProp?.picture);
        const newPicture = profileImageUrl ||
            constructedPhotoPath ||
            constructedPicture ||
            "";

        setImageState((prev) => ({
            ...prev,
            picture: newPicture,
        }));
    }, [profileImageUrl, profileProp?.profilePhotoPath, profileProp?.picture]);

    // Additional useEffect to ensure selected file image is displayed immediately
    useEffect(() => {
        if (profileImageUrl) {
            setImageState((prev) => ({
                ...prev,
                picture: profileImageUrl,
            }));
        }
    }, [profileImageUrl]);

    // Cleanup function for image URLs to prevent memory leaks
    useEffect(() => {
        return () => {
            if (profileImageUrl) {
                URL.revokeObjectURL(profileImageUrl);
            }
        };
    }, [profileImageUrl]);

    const handleIconClick = () => {
        fileInputRef.current.click();
    };

    const handleFileChange = (event) => {
        const file = event.target.files?.[0];
        if (!file) return;
        const previewUrl = URL.createObjectURL(file);
        setImageState({ picture: previewUrl, file });
        setProfileImageUrl(previewUrl); // Update profileImageUrl for consistency
        setLoadedFile(file); // Store the selected file
        if (typeof onFileSelect === "function") onFileSelect(file);
    };
    return (
        <>
            <div className="panel panel-default">
                <div className="panel-heading text-center">
                    <p
                        style={{
                            color: "#65636E",
                            fontSize: "15px",
                            fontFamily: "500",
                        }}
                    >
                        Profile Picture
                    </p>
                </div>
                <div
                    className="panel-body text-center"
                    style={{ position: "relative" }}
                >

                    <div className="main-pro-pic"
                        style={{
                            width: size === "small" ? "50px" : "120px",
                            height: size === "small" ? "50px" : "120px",
                            borderRadius: "50%",
                            backgroundColor: hasImage ? "transparent" : "#65636e",
                            display: "flex",
                            justifyContent: "center",
                            alignItems: "center",
                            fontSize: size === "small" ? "20px" : "36px",
                            fontWeight: "bold",
                            color: hasImage ? "transparent" : (profileProp.colorForDefaultName || "#e6e4ef"),
                            fontFamily: "Georama, sans-serif",
                            border: "2px solid #65636e",
                            backgroundImage: hasImage
                                ? `url(${imageState.picture})`
                                : `url(${DefaultProfilePhoto})`,
                            backgroundSize: "cover",
                            backgroundPosition: "center",
                        }}
                    >
                        {/* Colored initials removed since we always show default image when no user image */}
                    </div>
                    <input
                        type="file"
                        ref={fileInputRef}
                        style={{ display: "none" }}
                        accept="image/*"
                        onChange={handleFileChange}
                    />
                    <img
                        src={ProfileEdit}
                        onClick={handleIconClick}
                        style={{
                            position: "absolute",
                            width: size === "small" ? "20px" : "30.34px",
                            height: size === "small" ? "20px" : "30.34px",
                            left: size === "small" ? "32px" : "101.93px",
                            top: size === "small" ? "30px" : "70.75px",
                            cursor: "pointer",
                            marginTop: size === "small" ? "15px" : "30px",
                        }}
                    />
                </div>
            </div>
            {/* <UploadModal isOpen={modalType === "upload"} onClose={closeModal} showCamera={showCamera} setShowCamera={setShowCamera} onFileSelected={handleFileSelected} /> */}
        </>
    );
};

export default ProfilePicture;
