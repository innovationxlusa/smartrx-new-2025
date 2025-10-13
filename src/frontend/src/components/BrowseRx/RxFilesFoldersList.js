import { use, useCallback, useEffect, useMemo, useRef, useState } from "react";
import axios from "axios";
import "./RxFilesFoldersList.css";
import FileList from "./FileList";
import FolderView from "./FolderView";
import PatientViewList from "./PatientViewList";
import PatientProfileMenu from "./PatientProfileMenu";
import DoctorProfileMenu from "./DoctorProfileMenu";
import { Breadcrumb } from "react-bootstrap";
import PageTitle from "../static/PageTitle/PageTitle";
import { useFetchData } from "../../hooks/useFetchData";
import CustomInput from "../static/Commons/CustomInput";
import { useFolder } from "../../contexts/FolderContext";
import useApiClients from "../../services/useApiClients";
import SearchIcon from "../../assets/img/SearchIcon.svg";
import { useParams, useNavigate, useLocation } from "react-router-dom";
import { useUserContext } from "../../contexts/UserContext";
import FolderManagementModal from "./FolderManagementModal";
import NormalViewToggle from "../static/Toggles/NormalViewToggle";
import {
    findFolderById,
    renameFolderById,
    findFolderByPath,
} from "../../utils/utils";
import RxFolderShimmer from "./RxFolderShimmer";
import { VscSignOut } from "react-icons/vsc";
import { useLocalStorage } from "../../hooks/useLocalStorage";
import useApiServiceCall from "../../hooks/useApiServiceCall";



const RxFilesFoldersList = () => {
    
    const [search, setSearch] = useState("");
    const [modalType, setModalType] = useState(null);
    const [expandedIndex, setExpandedIndex] = useState(null);
    const [selectedFolder, setSelectedFolder] = useState(null);
    const [isPatientView, setIsPatientView] = useLocalStorage("isPatientView", false);
    const [isSwitchPatientEnabled, setIsSwitchPatientEnabled] = useState(false);
    const [isProfileMenuVisible, setIsProfileMenuVisible] = useState(false);
    const [isDoctorProfileMenuVisible, setIsDoctorProfileMenuVisible] = useState(false);
    const [currentFolder, setCurrentFolder] = useState(null);
    const [currentFolderInfo, setCurrentFolderInfo] = useState(null); // Track current folder info for navigation
    const [childrenData, setChildrenData] = useState(null); // Store children data from navigation
   
    const [currentPage, setCurrentPage] = useState(1);
    const [sortBy, setSortBy] = useState("createddateDesc");
    const [sortDirection, setSortDirection] = useState("desc");
    const [itemsPerPage, setItemsPerPage] = useState(10);
    const [debouncedSearch, setDebouncedSearch] = useState("");
 
    const [firstPageItems, setFirstPageItems] = useState([]);
    const [nextPageItems, setNextPageItems] = useState([]);
    const [isLoading, setIsLoading] = useState(false);
    const [error, setError] = useState(null);
    const [folderAndFileData, setFolderAndFileData] = useState([]);
    const [combinedItems, setCombinedItems] = useState([]);
    const [visibleItemsState, setVisibleItemsState] = useState([]);

    const [isFolderLoading, setIsFolderLoading] = useState(false);
    // const [allFolderError, setAllFolderError] = useState(null);
    // const [folderRefetch, setFolderRefetch] = useState(null);
    const [refetchData, setRefetchData] = useState(null);
    const [totalRecords, setTotalRecords] = useState(0);
    const [totalPaging, setTotalPaging] = useState(1);
    // const [folders, setFolders] = useState([]);
    const { user } = useUserContext();
    const profileMenuRef = useRef(null);
    const profileIconRef = useRef(null);
  
    const { api } = useApiClients();
    const navigate = useNavigate();
    const location = useLocation();
    const prevFolderIdRef = useRef(null);
    const fetchInFlightRef = useRef(false);
    const { "*": currentPath, patientId, folderId } = useParams();
    const { setSelectedFolder: setContextSelectedFolder, setRefetch } =
        useFolder();

    // Helper functions for sorting
    const getSortField = (sortBy) => {
        switch (sortBy) {
            case "alphabeticAsc":
            case "alphabeticDesc":
                return "name";
            case "createddateAsc":
            case "createddateDesc":            
                return "createdDate";
            default:
                return "createdDate";
        }
    };

    const getSortDirection = (sortBy) => {
        switch (sortBy) {
            case "alphabeticAsc": 
            case "createddateAsc":          
                return "asc";
            case "alphabeticDesc": 
            case "createddateDesc":
                return "desc";
            default:
                return "desc";
        }
    };

    const getSortDescription = (sortBy) => {
        switch (sortBy) {
            case "alphabeticAsc":
                return "Name: A to Z";
            case "alphabeticDesc":
                return "Name: Z to A";
            case "createddateAsc":
                return "Date: Oldest First";
            case "createddateDesc":
                return "Date: Newest First";
            default:
                return "Date: Newest First";
        }
    };

    // Stable key extractor for deduplication across pages
    const getItemKey = useCallback((item) => {
        // Prefer stable backend IDs for dedupe across pages
        const id = item?.folderId ?? item?.fileId ?? item?.prescriptionId ?? item?.patientId;
        if (id !== undefined && id !== null) return `id-${id}`;
        // If no reliable ID, return null so we don't over-dedupe
        return null;
    }, []);

    // Shallow identity check for first-page replacement to avoid update loops
    const listsEqualByKey = useCallback((a = [], b = []) => {
        if (a.length !== b.length) return false;
        for (let i = 0; i < a.length; i++) {
            const ka = getItemKey(a[i]);
            const kb = getItemKey(b[i]);
            if (ka !== kb) return false;
            // If keys are null, fallback to simple pointer equality
            if (ka === null && a[i] !== b[i]) return false;
        }
        return true;
    }, [getItemKey]);
    const colors = [
        "#e57373",
        "#f06292",
        "#ba68c8",
        "#64b5f6",
        "#4db6ac",
        "#81c784",
        "#ffb74d",
        "#ff8a65",
        "#a1887f",
        "#90a4ae",
        "#7986cb",
        "#ff8c00",
        "#008080",
        "#556b2f",
        "#8b0000",
        "#9932cc",
        "#ff1493",
        "#008b8b",
        "#006400",
        "#b22222",
        "#ff4500",
        "#2e8b57",
        "#8a2be2",
        "#d2691e",
        "#dc143c",
        "#000080",
    ];
    

    const getColorForLetter = (letter) => {
        const index = letter.toUpperCase().charCodeAt(0) - 65;
        return colors[index] || "#000";
    };
    const { logout } = useApiServiceCall();
    
    const handleLogout = useCallback(() => {
        logout("");
    }, [logout]);

    
  
    // Debounced search effect
    useEffect(() => {
        const timer = setTimeout(() => {
            setDebouncedSearch(search);
            setCurrentPage(1);
        }, 300);

        return () => clearTimeout(timer);
    }, [search]);

    // Create payload with the specified structure - use backend pagination
    const createPayload = () => {
        const payload = {  
            UserId: Number(user?.jti) || null,
            PatientId: patientId ? Number(patientId) : null, // Use PatientId from URL params or default to 1
            FolderId: folderId ? Number(folderId) : null, // Use folderId from URL params when available
            FolderHeirarchy: currentFolder ? currentFolder.folderHeirarchy + 1 : 0,
            ParentFolderId: currentFolder ? currentFolder.folderId : (folderId ? Number(folderId) : null),
            CurrentFolderPath: currentPath || null,
            PagingSorting: {
                PageNumber: currentPage, 
                PageSize: itemsPerPage, 
                SortBy: getSortField(sortBy),
                SortDirection: getSortDirection(sortBy),
            },
            ShowFoldersFirst: true,
        };
        return payload;
    };

    

    const {
        data: folders,
        isLoading: isFoldersLoading,
        error: allFoldersError,
        refetch: folderRefetch,
    } = useFetchData(
        api.getAllFoldersByUserId,
        null,
        null,
        null,
        null,
        Number(user?.jti)
    );
    
      
   

  // Memoize folders to prevent re-fetching and ensure data persistence
  const finalFolders = useMemo(() => {
    return Array.isArray(folders) ? folders : [];
}, [folders]);



    // Create payload for patient prescriptions
    const createPatientPrescriptionsPayload = () => {
        // Handle PatientId conversion more safely
        let processedPatientId = null;
        if (patientId) {
            const numPatientId = Number(patientId);
            if (!isNaN(numPatientId) && numPatientId > 0) {
                processedPatientId = numPatientId;
            }
        }
        
        const payload = {
            UserId: Number(user?.jti) || 0,
           // PatientId: processedPatientId, // Safely converted PatientId
            SearchKeyword: debouncedSearch || null,
            SearchColumn: null,
            PagingSorting: {
                PageNumber: currentPage, // Use actual current page
                PageSize: itemsPerPage, // Use actual items per page
                SortBy: getSortField(sortBy),
                SortDirection: getSortDirection(sortBy),
            },
        };
        return payload;
    };

    // Memoize payloads/params to avoid infinite loops from changing identities
    const browsePayload = useMemo(() => {
        const p = createPayload();
        // Add common backend aliases to maximize compatibility
        return {
            ...p,
        };
    }, [user?.jti, patientId, folderId, currentFolder, currentPath, debouncedSearch, sortBy, currentPage, itemsPerPage]);
    
    const browseExtraParams = useMemo(() => ({
        PageNumber: currentPage,
        PageSize: itemsPerPage,
        SortBy: getSortField(sortBy),
        SortDirection: getSortDirection(sortBy)
    }), [currentPage, itemsPerPage, sortBy]);
 
  
    useEffect(() => {
        let cancelled = false;
        (async () => {
            const response = await api.getBrowseRxFolderAndFileList(null, browsePayload);
            if (cancelled) return;
            if (response?.message === "Successful") {
            const resp = response.response;
            setFolderAndFileData(resp); 
        } else {
            setFolderAndFileData(null);
            setCombinedItems([]);
        }
        })(); 
        setCombinedItems(Array.isArray(allCombinedItems) ? allCombinedItems : []);
        //debugger;
        console.log("fetched data: ", combinedItems);
        setVisibleItemsState(Array.isArray(visibleItems) ? visibleItems : []);
        console.log("visibleItemsState: ", visibleItemsState);
        return () => { cancelled = true; };
    }, [browsePayload, itemsPerPage, currentPage, sortBy, sortDirection, debouncedSearch]); // stable, memoized

           
            // Set current folder info when viewing a specific folder
    useEffect(() => {
        if (!folderId) {
            setCurrentFolderInfo(prev => (prev !== null ? null : prev));
            return;
        }
        if (!folderAndFileData) return;
                const folderInfo = {
                    folderId: Number(folderId),
                    folderOrFileName: folderAndFileData.folderOrFileName || folderAndFileData.folderName || `Folder ${folderId}`,
                    createdDate: folderAndFileData.createdDate,
                    createdDateStr: folderAndFileData.createdDateStr,
                    parentFolderId: folderAndFileData.parentFolderId,
                    folderHeirarchy: folderAndFileData.folderHeirarchy || 0,
                    totalItems: folderAndFileData.children?.totalRecords || 0
                };
        setCurrentFolderInfo(prev => {
            if (prev &&
                prev.folderId === folderInfo.folderId &&
                prev.folderOrFileName === folderInfo.folderOrFileName &&
                prev.totalItems === folderInfo.totalItems) return prev;
            return folderInfo;
        });
    }, [folderId, folderAndFileData?.folderOrFileName, folderAndFileData?.children?.totalRecords]);

    // Handle navigation state with children data
    useEffect(() => {
        if (location.state && folderId) {
            const { folderId: stateFolderId, folderName, childrenData: stateChildrenData, parentFolder } = location.state;
            
            if (stateChildrenData && Array.isArray(stateChildrenData)) {
                setChildrenData(stateChildrenData);
                // Set current folder info from navigation state
                const folderInfo = {
                    folderId: stateFolderId,
                    folderOrFileName: folderName,
                    createdDate: parentFolder?.createdDate,
                    createdDateStr: parentFolder?.createdDateStr,
                    parentFolderId: parentFolder?.parentFolderId,
                    folderHeirarchy: (parentFolder?.folderHeirarchy || 0) + 1,
                    totalItems: stateChildrenData.length
                };
                setCurrentFolderInfo(folderInfo);
            }
        } else {
            // Clear children data when not in folder view
            setChildrenData(null);
        }
    }, [location.state, folderId]);

    // Check if we have a valid PatientId for Patient View
    const hasValidPatientId = patientId && !isNaN(Number(patientId)) && Number(patientId) > 0;
    const shouldCallPatientPrescriptions = isPatientView;


    // Patient prescriptions API call
    const {
        data: patientPrescriptionsData = {},
        isLoading: isPatientPrescriptionsLoading,
        error: patientPrescriptionsError,
        refetch: patientPrescriptionsRefetch,
    } = useFetchData(
        shouldCallPatientPrescriptions ? api.getPatientPrescriptions : null,
        shouldCallPatientPrescriptions ? currentPage : null, // Use actual current page
        shouldCallPatientPrescriptions ? itemsPerPage : null, // Use actual items per page
        shouldCallPatientPrescriptions ? getSortField(sortBy) : null,
        shouldCallPatientPrescriptions ? getSortDirection(sortBy) : null,
        shouldCallPatientPrescriptions ? { SearchParams: createPatientPrescriptionsPayload() } : null
    );

    // Total available count from backend pagination metadata or children data
    const totalAvailableCount = useMemo(() => {
        if (isPatientView) {          
            return Number(patientPrescriptionsData ?.totalRecords ?? 0) || 0;
        } else {            
            if (childrenData && Array.isArray(childrenData)) {
                return childrenData.length;
            } else {              
                return Number(folderAndFileData?.children?.totalRecords ?? 0) || 0;
            }
        }
    }, [isPatientView, childrenData, folderAndFileData?.children?.totalRecords, patientPrescriptionsData ?.totalRecords]);
   
    const totalPages = Math.max(1, Math.ceil(totalAvailableCount / itemsPerPage));  
    const canSeeMore = (visibleItemsState?.length < totalAvailableCount);
    const handleSeeMore = () => {
       
        if (!canSeeMore) {
            return;
        }
        setCurrentPage((p) => {
            const next = p + 1;
            const maxPage = Math.max(1, Math.ceil(totalAvailableCount / itemsPerPage));
            return Math.min(next, maxPage);
        });
  };

    // Ensure currentPage never exceeds totalPages when totals change
    useEffect(() => {
        const maxPage = Math.max(1, Math.ceil(totalAvailableCount / itemsPerPage));
        if (currentPage > maxPage) {
            setCurrentPage(maxPage);
        }
    }, [totalAvailableCount, itemsPerPage]);

    useEffect(() => {
        // Keep context in sync with current payload's folder if available
        const folderId = folderAndFileData?.folderId;
        if (folderId && folderId !== prevFolderIdRef.current) {
            setContextSelectedFolder(folderAndFileData);
            prevFolderIdRef.current = folderId;
        }
    }, [folderAndFileData, setContextSelectedFolder]);

    const openModal = (type) => {
        setModalType(type); // Open the modal and set the type
    };

    const closeModal = () => {
        setModalType(null); // Close the modal
    };

    const allCombinedItems = useMemo(() => {
        //debugger;
        if (isPatientView) {
            // Patient view: show patient prescriptions from backend API
            const prescriptions = Array.isArray(patientPrescriptionsData?.data)
                ? patientPrescriptionsData.data
                : [];
            
            // Apply search filter to prescriptions if search is active
            let filteredPrescriptions = prescriptions;
            if (debouncedSearch && debouncedSearch.trim()) {
                const searchTerm = debouncedSearch.toLowerCase().trim();
                filteredPrescriptions = prescriptions.filter(prescription => {
                    const name = (prescription?.patientName || prescription?.prescriptionName || '').toLowerCase();
                    return name.includes(searchTerm);
                });
            }

            // Sort prescriptions by selected sort
            const sortedPrescriptions = [...filteredPrescriptions].sort((a, b) => {
                    const parseDate = (raw) => {
                        if (!raw) return 0;
                        const ts = Date.parse(raw);
                        return Number.isNaN(ts) ? 0 : ts;
                    };
                    const itemDate = (item) => parseDate(item?.createdDate ?? item?.createdDateStr);
                const itemName = (item) => (item?.patientName || item?.prescriptionName || '')?.toLowerCase();

                    if (sortBy === 'alphabeticAsc' || sortBy === 'alphabeticDesc') {
                        const comparison = itemName(a).localeCompare(itemName(b));
                        return sortBy === 'alphabeticDesc' ? -comparison : comparison;
                    } else if (sortBy === 'createddateAsc' || sortBy === 'createddateDesc') {
                        const dateA = itemDate(a);
                        const dateB = itemDate(b);
                        return sortBy === 'createddateAsc' ? dateA - dateB : dateB - dateA;
                }
                        const dateA = itemDate(a);
                        const dateB = itemDate(b);
                        return dateB - dateA;
            });

            return sortedPrescriptions.map((prescription, index) => ({
                ...prescription,
                type: 'prescription',
                combinedIndex: index + 1,
            }));
        } else {
            // Normal view
            if (childrenData && Array.isArray(childrenData) && !isPatientView) {
                // Use navigation-provided data, preserve original order; filter only
                let filteredData = childrenData;
                if (debouncedSearch && debouncedSearch.trim()) {
                    const searchTerm = debouncedSearch.toLowerCase().trim();
                    filteredData = childrenData.filter(item => {
                        const name = (item?.folderOrFileName || item?.fileName || '').toLowerCase();
                        return name.includes(searchTerm);
                    });
                }

                return filteredData.map((item, index) => ({
                    ...item,
                    type: item.isFolder ? 'folder' : 'file',
                    combinedIndex: index + 1,
                }));
            } else {
                // Use backend data (children.data) and preserve API order (folders first, then files)
                const allItemsRaw = Array.isArray(folderAndFileData?.children?.data)
                    ? folderAndFileData?.children?.data
                    : [];
                
                // Optional search without reordering
                let filtered = allItemsRaw;
                if (debouncedSearch && debouncedSearch.trim()) {
                    const searchTerm = debouncedSearch.toLowerCase().trim();
                    filtered = allItemsRaw.filter(item => {
                        const name = (item?.folderOrFileName || item?.fileName || '').toLowerCase();
                        return name.includes(searchTerm);
                    });
                }
                return filtered.map((item, index) => ({
                    ...item,
                    type: item.isFolder ? 'folder' : 'file',
                    combinedIndex: index + 1,
                }));
            }
        }
    }, [isPatientView, childrenData, folderAndFileData?.children?.data, patientPrescriptionsData?.data, sortBy, debouncedSearch]);
    
    // Compute final visible list from the unified, searched, sorted list
    const computedVisibleItems = useMemo(() => {
        if (childrenData && Array.isArray(childrenData)) {
            // Client-side pagination for navigation-provided data
            const endIndex = currentPage * itemsPerPage;
            return allCombinedItems.slice(0, endIndex);
        }
        // For backend paginated views (patient or normal), show current known items
        // If accumulation is present, you could merge pages; here we present current processed items
        return allCombinedItems;
    }, [allCombinedItems, childrenData, currentPage, itemsPerPage]);

    // Keep state visibleItems in sync so UI renders from one source
    useEffect(() => {
        setVisibleItemsState(computedVisibleItems);
    }, [computedVisibleItems]);

    useEffect(() => {
        // Backend pagination accumulation
        if (!childrenData) {
            if (currentPage === 1) {
                // Only replace if actually changed to avoid loops
                setFirstPageItems(prev => {
                    if (prev.length === allCombinedItems.length) {
                        let same = true;
                        for (let i = 0; i < prev.length; i++) {
                            const ka = getItemKey(prev[i]);
                            const kb = getItemKey(allCombinedItems[i]);
                            if (ka !== kb) { same = false; break; }
                        }
                        if (same) return prev;
                    }
                    return allCombinedItems;
                });
                // Clear next page items only if non-empty
                setNextPageItems(prev => (prev.length ? [] : prev));
            } else if (allCombinedItems.length > 0) {
                // Append only new items to nextPageItems using stable keys
                setNextPageItems(prev => {
                    // Avoid deduping unless we have reliable IDs
                    const hasReliableIds = allCombinedItems.every(i => getItemKey(i) !== null);
                    if (!hasReliableIds) {
                        return [...prev, ...allCombinedItems];
                    }
                    const existingKeys = new Set([
                        ...firstPageItems.map(getItemKey).filter(Boolean),
                        ...prev.map(getItemKey).filter(Boolean)
                    ]);
                    const newItems = allCombinedItems.filter(item => {
                        const key = getItemKey(item);
                        return key ? !existingKeys.has(key) : true;
                    });
                    if (newItems.length === 0) return prev;
                    return [...prev, ...newItems];
                });
            }
        } else {
            // Using childrenData (client-side pagination): no accumulation; handled via slicing below
            setFirstPageItems(prev => (prev.length ? [] : prev));
            setNextPageItems(prev => (prev.length ? [] : prev));
        }
    }, [allCombinedItems, currentPage, childrenData, getItemKey, firstPageItems]);
    
    // Use backend data directly or apply client-side pagination for children data
    const visibleItems = useMemo(() => {
        //debugger;
        if (childrenData && Array.isArray(childrenData)) {
            // Normal View with children data: Apply client-side pagination
            const endIndex = currentPage * itemsPerPage;
            const items = allCombinedItems.slice(0, endIndex);
            return items;
        } else {
            // Backend pagination (patient or normal): concat first and next pages
            if (firstPageItems.length === 0 && nextPageItems.length === 0) {
            return allCombinedItems;
        }
            // If we don't have reliable IDs, skip dedupe to avoid shrinking counts
            const everyHasId = [...firstPageItems, ...nextPageItems].every(i => getItemKey(i) !== null);
            if (!everyHasId) {
                return [...firstPageItems, ...nextPageItems];
            }
            const combined = [...firstPageItems, ...nextPageItems];
            const seen = new Set();
            const result = [];
            //for (const item of combined) {
            //    const key = getItemKey(item);
            //    if (!seen.has(key)) {
            //        seen.add(key);
            //        result.push(item);
            //    }
            //}
            return combined;
        }
    }, [allCombinedItems, firstPageItems, nextPageItems, currentPage, itemsPerPage, childrenData, getItemKey]);
    // First toggle handler for Patient View vs Normal View
    const handleViewToggle = (e) => {
        const isPatientViewEnabled = e.target.checked;
        console.log('Toggle switched to:', isPatientViewEnabled ? 'Patient View' : 'Normal View');
        console.log('Current patientId:', patientId);
        console.log('Current user jti:', user?.jti);
        
        setIsPatientView(isPatientViewEnabled);
        setCurrentPage(1); // Reset to first page when switching views
        setChildrenData(null); // Clear children data when switching views
        setCurrentFolderInfo(null); // Clear folder info when switching views
        setFirstPageItems([]);
        setNextPageItems([]);
        
        // Reset search when switching views
        setSearch("");
        setDebouncedSearch("");
        
        // If switching to Patient View and currently in a folder, navigate to root
        if (isPatientViewEnabled && (folderId || currentFolderInfo)) {
            console.log('Switching to Patient View - navigating to root');
            navigate('/browserx');
        }
        
        console.log('View switched to:', isPatientViewEnabled ? 'Patient View' : 'Normal View');
        console.log('API call will be:', isPatientViewEnabled ? 'api.getPatientPrescriptions' : 'api.getBrowseRxFolderAndFileList');
    };

    // Second toggle handler for Switch Patient menu
    const handleSwitchPatientToggle = (e) => {
        const isSwitchPatientChecked = e.target.checked;
        setIsSwitchPatientEnabled(isSwitchPatientChecked);

        // Show/hide profile menu based on toggle state
        if (isSwitchPatientChecked) {
            setIsProfileMenuVisible(true);
            setIsDoctorProfileMenuVisible(true);
        } else {
            setIsProfileMenuVisible(false);
            setIsDoctorProfileMenuVisible(false);
        }
    };

    const toggleDoctorProfileMenu = useCallback((e) => {
        // Prevent event bubbling to avoid immediate close when clicking the icon
        e.stopPropagation();
        setIsDoctorProfileMenuVisible((prev) => !prev);
    }, []);
    const handleBreadcrumbClick = useCallback((e, pathUpToSegment, isLast) => {
        // Also navigate if not the last segment
        if (!isLast) {
            navigate(`/browserx/${pathUpToSegment}`);
        }
    }, [navigate]);

    const handleBackToRoot = useCallback(() => {
        navigate('/browserx');
    }, [navigate]);

   
    const handleFolderClick = useCallback((folder) => {
        // Check if folder has children and children.data.length > 0
        if (folder.children && folder.children.data && folder.children.data.length > 0) {
            setCurrentFolder(folder);
            setCurrentPage(1);
            // Navigate to folder path
        }
    }, [navigate, currentPath]);

    // Add back missing view toggle handler to switch between Patient and Normal views
    

    // getPageNumbers function following Investigation.js pattern
    const getPageNumbers = (current, total) => {
        const delta = 2;
        const range = [];
        const rangeWithDots = [];
        let l;

        for (let i = 1; i <= total; i++) {
            if (
                i === 1 ||
                i === total ||
                (i >= current - delta && i <= current + delta)
            ) {
                range.push(i);
            }
        }

        for (let i of range) {
            if (l) {
                if (i - l === 2) rangeWithDots.push(l + 1);
                else if (i - l !== 1) rangeWithDots.push(null);
            }
            rangeWithDots.push(i);
            l = i;
        }
        return rangeWithDots;
    };

    // Profile menu handlers
    const handleCloseDoctorProfileMenu = () => {
        setIsDoctorProfileMenuVisible(false);
    };
    const handleRenameClick = (folder) => {
        setSelectedFolder(folder);
        openModal("rename");
    };

    const handleDeleteClick = (folder) => {
        try {
            setSelectedFolder(folder);
            openModal("delete");
        } catch (error) {
            console.error('Error opening delete modal:', error);
            alert(`Error opening delete modal: ${error.message || 'Unknown error occurred'}`);
        }
    };

    return isFoldersLoading || isLoading || isPatientPrescriptionsLoading? (
        <RxFolderShimmer />
    ) : (
        <div className="content-container">
            <div className="rx-folder-container row px-3 px-md-5">
                <div className="col-12 col-md-9 col-lg-7 col-xl-6 mx-auto p-0">
                    <PageTitle pageName={
                        isPatientView 
                            ? "Rx Folder" 
                            : currentFolderInfo 
                                ? currentFolderInfo.folderOrFileName 
                                : folderId 
                                    ? `Folder (ID: ${folderId})` 
                                    : currentFolder 
                                        ? currentFolder.folderOrFileName 
                                        : "Rx Folder"
                    } />
                    
                    {/* Only show breadcrumb navigation in Normal View */}
                    {!isPatientView && (
                        <Breadcrumb className="my-3 custom-breadcrumb">
                            {/* Home/Root breadcrumb */}
                            <Breadcrumb.Item 
                                onClick={() => navigate('/browserx')}
                                style={{ cursor: 'pointer' }}
                            >
                                Rx Folder
                            </Breadcrumb.Item>
                            
                            {/* Current folder breadcrumb if viewing a specific folder */}
                            {currentFolderInfo && (
                                <>
                                    {/* Parent folder breadcrumb if exists */}
                                    {currentFolderInfo.parentFolderId && (
                                        <Breadcrumb.Item 
                                            onClick={() => navigate(`/browserx/folder/${currentFolderInfo.parentFolderId}`)}
                                            style={{ cursor: 'pointer' }}
                                        >
                                            ← Back to Parent
                                        </Breadcrumb.Item>
                                    )}
                                    
                                    {/* Current folder breadcrumb */}
                                    <Breadcrumb.Item active>
                                        {currentFolderInfo.folderOrFileName}
                                    </Breadcrumb.Item>
                                </>
                            )}
                        </Breadcrumb>
                    )}
                    <div className="d-flex justify-content-between align-items-center">
                        <CustomInput
                            className={"w-100"}
                            rightIcon={SearchIcon}
                            name="search"
                            type="text"
                            placeholder="Search"
                            value={search}
                            onChange={(e) => setSearch(e.value)}
                            minHeight="0px"
                        />
                        <div className="d-flex align-items-center gap-2">
                            {/* Back to Root button when viewing a specific folder (only in Normal View) */}
                            {/*currentFolderInfo && !isPatientView && (
                                <button
                                    className="btn btn-outline-secondary btn-sm"
                                    onClick={handleBackToRoot}
                                    style={{ whiteSpace: 'nowrap' }}
                                >
                                    ← Back to Root
                                </button>
                            )*/}
                            <NormalViewToggle
                                isPatientView={isPatientView}
                                onToggle={handleViewToggle}
                            />
                        </div>
                    </div>

                    {/* Sorting Controls following Investigation.js pattern */}
                    <div 
                        className={`sortby sortby-${sortBy} sortby-${getSortField(sortBy)}-${getSortDirection(sortBy)} d-flex justify-content-between align-items-center mt-3 mb-2`}
                        data-sort-type={sortBy}
                        data-sort-field={getSortField(sortBy)}
                        data-sort-direction={getSortDirection(sortBy)}
                        data-sort-description={getSortDescription(sortBy)}
                    >
                        <div className="d-flex align-items-center gap-2">
                            <label className="form-label mb-0">Sort by:</label>
                            <select
                                className="form-select form-select-sm"
                                style={{ width: "auto", minWidth: "200px" }}
                                value={sortBy}
                                onChange={(e) => {
                                    console.log("Sort dropdown changed to:", e.target.value);
                                    console.log("New sort classes will be:", {
                                        sortBy: e.target.value,
                                        sortField: getSortField(e.target.value),
                                        sortDirection: getSortDirection(e.target.value),
                                        sortDescription: getSortDescription(e.target.value)
                                    });
                                    setSortBy(e.target.value);
                                    setCurrentPage(1);
                                }}
                            >  
                                <option value="createddateAsc">Date: Oldest First</option>
                                <option value="createddateDesc">Date: Newest First</option>   
                                <option value="alphabeticAsc">Name: A to Z</option>
                                <option value="alphabeticDesc">Name: Z to A</option>
                                                          
                            </select>
                        </div>
                        <div className="items-per-page d-flex align-items-center gap-2">
                            <label className="form-label mb-0">Show:</label>
                            <select
                                className="form-select form-select-sm"
                                style={{ width: "auto" }}
                                value={itemsPerPage}
                                onChange={(e) => {
                                    console.log("Items per page changed to:", e.target.value);
                                    setItemsPerPage(Number(e.target.value));
                                    // Page will be reset by useEffect
                                }}
                            >
                                <option value={10}>10</option>
                                <option value={20}>20</option>
                                <option value={50}>50</option>
                                <option value={100}>100</option>
                            </select>
                        </div>
                    </div>

                    <div className="mt-3 h-100 overflow-auto">
                        {/** Ensure visibleItems is always a safe array to avoid length errors */}
                        {(() => { return null; })()}
                        {/** Safe alias */}
                        { /* no-op to keep structure */ }
                        {/* Show PatientViewList if Patient View is enabled */}
                        {isPatientView ? (
                            (Array.isArray(visibleItemsState) && visibleItemsState.length > 0) ? (
                                visibleItemsState.map((prescription, index) => (
                                        <PatientViewList
                                            key={`prescription-${prescription.prescriptionId ?? prescription.patientId ?? prescription.combinedIndex ?? index}`}
                                            patient={prescription}
                                            index={index}
                                        />
                                ))
                            ) : (
                                <div className="text-center mt-5 text-muted">
                                    {hasValidPatientId ? "No prescriptions found" : "Patient View requires a valid Patient ID"}
                                </div>
                            )
                        ) : (Array.isArray(visibleItemsState) && visibleItemsState.length > 0) ? (
                            (visibleItemsState || []).map((child, index) => {
                                
                                if (child.type === 'folder') {
                                    return (
                                        <FolderView
                                            key={child.folderId}
                                            item={child}
                                            index={index}
                                            expandedIndex={expandedIndex}
                                            setExpandedIndex={setExpandedIndex}
                                            onClick={() => handleFolderClick(child.folderOrFileName)}
                                            onRenameClick={handleRenameClick}
                                            onDeleteClick={handleDeleteClick}
                                            foldersList={folders}
                                        />
                                    );
                                } else if (child.type === 'file') {                                   
                                    return (
                                         <FileList
                                            key={`file-${child.fileId ?? child.fileName ?? child.combinedIndex ?? index}`}
                                            item={child}
                                            index={index}
                                            expandedIndex={expandedIndex}
                                            setExpandedIndex={setExpandedIndex}
                                            foldersList={folders}
                                            totalPrescriptions={child.totalPrescriptions}
                                        />
                                    );
                                }
                                return null;
                            })
                        ) : (
                            <div className="text-center mt-5 text-muted">
                                This folder is empty
                            </div>
                        )}
                        {Array.isArray(visibleItemsState) && visibleItemsState.length > 0 && (
                            <div className="mt-4">
                                <div className="d-flex justify-content-center align-items-center mb-2">
                                    <div className="text-muted">
                                        {`Showing ${visibleItemsState.length} of ${totalAvailableCount} items (Page ${currentPage} of ${totalPages})`}
                                    </div>
                                </div>
                                {canSeeMore && (
                                    <div className="d-flex justify-content-center">
                                        <button
                                            className="see-more-button"
                                            onClick={handleSeeMore}
                                        >
                                            See more ...
                                        </button>
                                    </div>
                                )}
                            </div>
                        )}
                    </div>
                    {/* See More pattern */}

                </div>
            </div>
            <FolderManagementModal
                modalType={modalType}
                isOpen={!!modalType}
                folderData={selectedFolder}
                onClose={closeModal}
                fetchFolders={() => {
                    try {
                        refetch();
                    } catch (error) {
                        console.error('Error refetching data:', error);
                        alert(`Error refreshing data: ${error.message || 'Unknown error occurred'}`);
                    }
                }}
                folderRefetch={() => {
                    try {
                        folderRefetch();
                    } catch (error) {
                        console.error('Error refetching folders:', error);
                        alert(`Error refreshing folders: ${error.message || 'Unknown error occurred'}`);
                    }
                }}
            />

            {/* Doctor Profile Menu */}
            <DoctorProfileMenu
                isVisible={isDoctorProfileMenuVisible}
                onClose={handleCloseDoctorProfileMenu}
            />
        </div>
    );
};

export default RxFilesFoldersList;
