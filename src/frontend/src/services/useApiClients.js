import useApiService from "./useApiService";
import {
    PRESCRIPTION_UPLOAD_URL,
    PRESCRIPTION_DOWNLOAD_URL,
    REQUEST_FOR_SMART_RX_URL,
    CREATE_NEW_FOLDER_URL,
    FETCH_BROWSE_RX_FOLDER_FILES_URL,
    FETCH_ALL_FOLDER_URL,
    MOVE_FILE_URL,
    TAG_FILE_URL,
    FETCH_SMART_RX_INSIDER_URL,
    FETCH_MEDICINE_LIST_COMPARE_URL,
    FETCH_TEST_LIST_COMPARE_URL,
    FETCH_DOCTOR_RECOMMENDED_OR_SELECTED_TEST_LIST_URL,
    FETCH_MEDICINE_FAQ_URL,
    FETCH_VITAL_URL,
    FETCH_INVESTIGATION_TEST_CENTERS_URL,
    EDIT_SMART_RX_INVESTIGATION_WISH_LIST_URL,
    EDIT_MEDICINE_FAVORITE_URL,
    EDIT_INVESTIGATION_TEST_CENTERS_URL,
    UPDATE_PATIENT_PROFILE_URL,
    CREATE_PATIENT_PROFILE_URL,
    UPDATE_DOCTOR_REVIEW_URL,
    CREATE_NEW_VITAL_URL,
    FETCH_PATIENT_PROFILE_URL,
    FETCH_DOCTOR_PROFILE_URL,
    USER_URL,
    ROLE_URL,
    AD_USER_URL,
    PAGINATED_USER_URL,
    AUTHORITIES_URL,
    PAGINATED_ROLE_URL,
    FUNCTION_ASSIGN_URL,
    WHITE_LIST_URL,
    PAGINATED_WHITE_LIST_URL,
    FETCH_INVESTIGATION_FAQ_URL,
    FETCH_VITAL_FAQ_URL,
    SPECIAL_NUMBERS_URL,
    PAGINATED_SPECIAL_NUMBERS_URL,
    SEARCH_REQUEST_URL,
    FUNCTION_URL,
    APP_AUDIT_URL,
    APP_CDR_URL,
    APP_ESAF_VIEW_URL,
    APP_SMS_VIEW_URL,
    APP_SMS_REPORT_URL,
    APP_EMAIL_REPORT_URL,
    NOT_DOWNLOADED_SEARCH_REQUEST_URL,
    APP_NTMC_REPORT_URL,
    APP_SENDMAIL_URL,
    DELETE_SMARTRX_VITAL_BY_ID_URL,
    FETCH_PATIENT_OR_RELATIVE_DROPDOWN_URL,
    FETCH_PATIENT_PRESCRIPTIONS_URL,
    FETCH_PATIENT_PRESCRIPTIONS_BY_TYPE_URL,
    FETCH_PATIENT_PROFILE_LIST_URL,
    FETCH_DOCTOR_PROFILE_LIST_URL,
    FETCH_PATIENT_VITAL_LIST_URL
} from "../constants/apiEndpoints";

/**
 * Custom hook for interacting with various API clients.
 * This hook consolidates common API methods such as create, update, delete, fetch, etc.
 * The API clients cover users, roles, white-listed numbers, special numbers, search requests,
 * function codes, and application audit logs.
 */
const useApiClients = () => {
    // Destructure methods from the useApiService hook
    const {
        getAll,
        getAllWithPostMethod,
        getById,
        getPaginatedList,
        create,
        update,
        remove,
        changePassword,
        updateProfile,
        uploadFile,
        downloadFile,
        downloadFileAs,
        post,
    } = useApiService();

    const api = {
        /**
         * SmartRx - Insider -related API methods.
         */

        getSmartRxInsiderByUserId: (signal = null, payload) =>
            getAllWithPostMethod(
                FETCH_SMART_RX_INSIDER_URL,
                (signal = null),
                payload,
            ),
        // getSmartRxInsiderMedicineFAQByMedicineId: (signal = null, payload) => getById(FETCH_MEDICINE_FAQ_URL, (signal = null), payload),
        getSmartRxInsiderMedicineFAQByMedicineId: (signal, medicineId) =>
            getById(FETCH_MEDICINE_FAQ_URL, medicineId),

        getSmartRxInsiderInvestigationFAQByTestId: (signal, investigationId) =>
            getById(FETCH_INVESTIGATION_FAQ_URL, null, investigationId),

        getSmartRxInsiderVitalFAQByVitalId: (signal, vitalId) =>
            getById(FETCH_VITAL_FAQ_URL, null, vitalId),

        getPatientProfileListById: (signal = null, payload) =>
            getAllWithPostMethod(
                FETCH_PATIENT_PROFILE_LIST_URL,
                (signal = null),
                payload,
            ),

        getPatientVitalListById: (signal = null, payload) =>
            getAllWithPostMethod(
                FETCH_PATIENT_VITAL_LIST_URL,
                (signal = null),
                payload,
            ),

        getPatientVitalListFilterById: (signal = null, payload) =>
            getAllWithPostMethod(
                FETCH_PATIENT_VITAL_LIST_URL,
                signal, // pass signal directly
                JSON.stringify(payload), // stringify payload
                { "Content-Type": "application/json" }, // set headers
            ),
        /**
         * Prescription-related API methods.
         */
        getBrowseRxFolderAndFileList: (signal = null, payload) =>
            getAllWithPostMethod(
                FETCH_BROWSE_RX_FOLDER_FILES_URL,
                (signal = null),
                payload,
            ),
        getSmartRxInsiderByUserId: (signal = null, payload) =>
            getAllWithPostMethod(
                FETCH_SMART_RX_INSIDER_URL,
                (signal = null),
                payload,
            ),
        getMedicineListToCompare: (signal = null, payload) =>
            getAllWithPostMethod(
                FETCH_MEDICINE_LIST_COMPARE_URL,
                (signal = null),
                payload,
            ),
        getTestCenterListToCompare: (signal = null, payload) =>
            getAllWithPostMethod(
                FETCH_TEST_LIST_COMPARE_URL,
                (signal = null),
                payload,
            ),
        getDoctorRecommendedTestList: (signal = null, payload) =>
            getAllWithPostMethod(
                FETCH_DOCTOR_RECOMMENDED_OR_SELECTED_TEST_LIST_URL,
                (signal = null),
                payload,
            ),

        getInvestigationTestCenterList: (signal = null) => {
            return getAll(FETCH_INVESTIGATION_TEST_CENTERS_URL, signal);
        },

        updateInvestigationWishList: (payload, topic) =>
            update(EDIT_SMART_RX_INVESTIGATION_WISH_LIST_URL, payload, topic),

        updateMedicineWishList: (payload, topic) =>
            update(EDIT_MEDICINE_FAVORITE_URL, payload, topic),

        //getVitalsByVitalName: (signal = null, payload) => getAllWithPostMethod(FETCH_VITAL_URL, (signal = null), payload),
        getVitalsByVitalName: ({ VitalName }) => {
            return post(FETCH_VITAL_URL, { VitalName });
        },

        getPatientDataById: ({ patientId }) => {
            return post(FETCH_PATIENT_PROFILE_URL, { patientId });
        },

        createNewVital: (payload, topic) =>
            create(CREATE_NEW_VITAL_URL, payload, topic),

        getSmartRxInsiderMedicineFAQByMedicineId: (signal = null, payload) =>
            getById(FETCH_MEDICINE_FAQ_URL, (signal = null), payload),

        moveFile: (payload, prescriptionId, topic) =>
            update(`${MOVE_FILE_URL}/${prescriptionId}`, payload, topic),
        tagFile: (payload, prescriptionId, topic) =>
            update(`${TAG_FILE_URL}/${prescriptionId}`, payload, topic),
        getAllFoldersByUserId: (signal, userId) =>
            getAll(`${FETCH_ALL_FOLDER_URL}/${userId}`, signal),
        downloadPrescription: (prescriptionId, fileName) =>
            fileName
                ? downloadFileAs(
                      `${PRESCRIPTION_DOWNLOAD_URL}/${prescriptionId}`,
                      fileName,
                  )
                : downloadFile(
                      `${PRESCRIPTION_DOWNLOAD_URL}/${prescriptionId}`,
                  ),
        investigationCenterListUpdate: (payload, topic) =>
            update(`${EDIT_INVESTIGATION_TEST_CENTERS_URL}`, payload, topic),
        patientUpdate: (id, payload, topic) =>
            update(
                UPDATE_PATIENT_PROFILE_URL.replace("{id}", id),
                payload,
                topic,
                "PATCH",
                payload instanceof FormData,
            ),
        createPatient: (payload, topic) =>
            create(
                CREATE_PATIENT_PROFILE_URL,
                payload,
                topic,
                payload instanceof FormData
            ),
        docReviewUpdate: (payload, topic) =>
            update(UPDATE_DOCTOR_REVIEW_URL, payload, topic, "PATCH"),
        patientOrRelativeDropdownLoad: (signal = null, payload) =>
            getById(
                FETCH_PATIENT_OR_RELATIVE_DROPDOWN_URL,
                (signal = null),
                payload,
            ),

        /**
         * Prescription-related API methods.
         */
        prescriptionUpload: (payload, onUploadProgress = null, topic) =>
            uploadFile(
                PRESCRIPTION_UPLOAD_URL,
                payload,
                onUploadProgress,
                topic,
            ),
        requestForSmartRxUpload: (payload, prescriptionId, topic) =>
            update(REQUEST_FOR_SMART_RX_URL + prescriptionId, payload, topic),
        createNewFolder: (payload, topic) =>
            create(CREATE_NEW_FOLDER_URL, payload, topic),

        // Doctor-related API methods.
        getDoctorDetailsById: (signal = null, payload) =>
            getAllWithPostMethod(
                FETCH_DOCTOR_PROFILE_URL,
                (signal = null),
                payload,
            ),

        // Patient/Relative dropdown for profile details
        getPatientOrRelativeDropdown: (signal = null) =>
            getAll(FETCH_PATIENT_OR_RELATIVE_DROPDOWN_URL, (signal = null)),

        // Doctor profile list by user id
        getDoctorProfilesByUserId: (signal = null, payload) =>
            getAllWithPostMethod(
                FETCH_DOCTOR_PROFILE_LIST_URL,
                (signal = null),
                payload,
            ),

        // Patient prescriptions with pagination
        getPatientPrescriptions: (signal = null, payload) =>
            getAllWithPostMethod(
                FETCH_PATIENT_PRESCRIPTIONS_URL,
                (signal = null),
                payload,
            ),

        // Patient prescriptions by type with pagination
        getPatientPrescriptionsByType: (signal = null, payload) =>
            getAllWithPostMethod(
                FETCH_PATIENT_PRESCRIPTIONS_BY_TYPE_URL,
                (signal = null),
                payload,
            ),

        /**
         * User-related API methods.
         */
        createUser: (payload, topic) => create(USER_URL, payload, topic),
        updateUser: (payload, topic) => update(USER_URL, payload, topic),
        getAllUsers: (signal = null) => getAll(USER_URL, (signal = null)),
        getAllPaginatedUsers: (signal = null, page, limit, sortBy) =>
            getPaginatedList(
                PAGINATED_USER_URL,
                (signal = null),
                page,
                limit,
                sortBy,
            ),
        deleteSmartRxVitalById: (smartRxVitalId, topic, payload = null) =>
            remove(
                DELETE_SMARTRX_VITAL_BY_ID_URL,
                smartRxVitalId,
                topic,
                payload,
            ),

        getUserDetails: (userId) => getById(USER_URL, userId),
        deleteUser: (userId, topic, payload = null) =>
            remove(USER_URL, userId, topic, payload),
        getAllADUsers: (signal = null) => getAll(AD_USER_URL, (signal = null)),
        getUserAuthorities: (signal = null) =>
            getAll(AUTHORITIES_URL, (signal = null)),
        assignUserRole: (userId, payload, topic) =>
            create(`${USER_URL}/${userId}`, payload, topic),

        /**
         * Role-related API methods.
         */
        createRole: (payload, topic) => create(ROLE_URL, payload, topic),
        updateRole: (payload, topic) => update(ROLE_URL, payload, topic),
        getAllRoles: (signal = null) => getAll(ROLE_URL, (signal = null)),
        getAllPaginatedRoles: (signal = null, page, limit, sortBy) =>
            getPaginatedList(
                PAGINATED_ROLE_URL,
                (signal = null),
                page,
                limit,
                sortBy,
            ),
        getRoleDetails: (roleId) => getById(ROLE_URL, roleId),
        deleteRole: (roleId, topic, payload = null) =>
            remove(ROLE_URL, roleId, topic, payload),
        assignRoleFunctions: (roleId, payload, topic) =>
            create(`${FUNCTION_ASSIGN_URL}/${roleId}`, payload, topic),

        /**
         * White-listed number-related API methods.
         */
        createWhiteList: (payload, topic) =>
            create(WHITE_LIST_URL, payload, topic),
        updateWhiteList: (payload, topic) =>
            update(WHITE_LIST_URL, payload, topic),
        getAllWhiteLists: (signal = null) =>
            getAll(WHITE_LIST_URL, (signal = null)),
        getAllPaginatedWhiteLists: (signal = null, page, limit, sortBy) =>
            getPaginatedList(
                PAGINATED_WHITE_LIST_URL,
                (signal = null),
                page,
                limit,
                sortBy,
            ),
        getWhiteListDetails: (whiteListId) =>
            getById(WHITE_LIST_URL, whiteListId),
        deleteWhiteList: (whiteListId, topic, payload = null) =>
            remove(WHITE_LIST_URL, whiteListId, topic, payload),
        whiteListApproval: (WhiteListId, status, topic) =>
            update(
                `${WHITE_LIST_URL}/id/${WhiteListId}/approvalstatus/${status}`,
                null,
                topic,
            ),

        /**
         * Special number-related API methods.
         */
        createSpecialNumber: (payload, topic) =>
            create(SPECIAL_NUMBERS_URL, payload, topic),
        updateSpecialNumber: (payload, topic) =>
            update(SPECIAL_NUMBERS_URL, payload, topic),
        getAllSpecialNumbers: (signal = null) =>
            getAll(SPECIAL_NUMBERS_URL, (signal = null)),
        getAllPaginatedSpecialNumbers: (signal = null, page, limit, sortBy) =>
            getPaginatedList(
                PAGINATED_SPECIAL_NUMBERS_URL,
                (signal = null),
                page,
                limit,
                sortBy,
            ),
        getSpecialNumberDetails: (specialNumberId) =>
            getById(SPECIAL_NUMBERS_URL, specialNumberId),
        deleteSpecialNumber: (specialNumberId, topic, payload = null) =>
            remove(SPECIAL_NUMBERS_URL, specialNumberId, topic, payload),
        specialNumberApproval: (specialNumberId, status, topic) =>
            update(
                `${SPECIAL_NUMBERS_URL}/id/${specialNumberId}/approvalstatus/${status}`,
                null,
                topic,
            ),

        /**
         * Function code-related API methods for managing access permissions.
         */
        getAllFunctionCodes: (signal = null) =>
            getAll(FUNCTION_URL, (signal = null)),
        getAllPaginatedFunctionCodes: (signal = null, page, limit, sortBy) =>
            getPaginatedList(
                FUNCTION_URL,
                (signal = null),
                page,
                limit,
                sortBy,
            ),
        getFunctionCodeDetails: (functionCodeId) =>
            getById(FUNCTION_URL, functionCodeId),

        /**
         * Application audit log-related API methods.
         */
        getPaginatedAppAuditLogs: (signal = null, page, limit, sortBy) =>
            getPaginatedList(
                APP_AUDIT_URL,
                (signal = null),
                page,
                limit,
                sortBy,
            ),

        /**
         * Search request-related API methods.
         */
        createSearchRequest: (payload, topic) =>
            create(SEARCH_REQUEST_URL, payload, topic),
        updateSearchRequestStatus: (payload, topic) =>
            update(`${SEARCH_REQUEST_URL}/update-status`, payload, topic),
        getAllSearchRequests: (signal = null) =>
            getAll(SEARCH_REQUEST_URL, (signal = null)),
        getSearchRequestDetails: (searchRequestId) =>
            getById(SEARCH_REQUEST_URL, searchRequestId),
        getSearchRequestResponseDetails: (searchRequestId) =>
            getById(`${SEARCH_REQUEST_URL}/search-response`, searchRequestId),
        downloadSearchRequestZip: (searchRequestId, reportType) =>
            downloadFile(
                `${SEARCH_REQUEST_URL}/requests/${searchRequestId}/responseType/${reportType}`,
            ),
        downloadSearchRequestFile: (
            searchRequestId,
            reportType,
            download = false,
        ) =>
            downloadFile(
                `${SEARCH_REQUEST_URL}/request/${searchRequestId}${
                    reportType === "esaf"
                        ? `/esaf?download=${download}`
                        : `/responseType/${reportType}`
                }`,
            ),
        getAllPendingSearchRequestApprovals: (signal = null) =>
            getAll(APP_SEARCH_APPROVAL_URL, (signal = null)),
        approveSearchRequest: (searchRequestId, status) =>
            update(
                `${SPECIAL_NUMBERS_URL}/id/${searchRequestId}/approvalstatus/${status}`,
                payload,
                topic,
            ),
        getAllFilteredSearchRequest: (
            signal = null,
            startDate,
            endDate,
            uniqueCode,
        ) =>
            getAll(
                `${SEARCH_REQUEST_URL}/filter?startDate=${startDate}&endDate=${endDate}&uniqueCode=${uniqueCode}`,
                (signal = null),
            ),
        getAllNotDownloadedSearchRequestData: (signal = null) =>
            getAll(NOT_DOWNLOADED_SEARCH_REQUEST_URL, signal),

        /**
         * Search CDR API methods.
         */
        getAllCdrId: (cdrId) => getById(APP_CDR_URL, cdrId),
        getEsafById: (searchRequestId) =>
            getAll(
                `${APP_ESAF_VIEW_URL}/${searchRequestId}/esaf?download=false`,
                null,
                true,
            ),
        getAllSmSbyId: (objId) => getById(APP_SMS_VIEW_URL, objId),

        getAllSmsReportList: (signal = null, startDate, endDate) =>
            getAll(
                `${APP_SMS_REPORT_URL}/${startDate}/${endDate}`,
                (signal = null),
            ),

        getAllEmailReportList: (signal = null, startDate, endDate) =>
            getAll(
                `${APP_EMAIL_REPORT_URL}?startDate=${startDate}&endDate=${endDate}`,
                (signal = null),
            ),

        getAllNtmcReportList: (signal = null, startDate, endDate) =>
            getAll(
                `${APP_NTMC_REPORT_URL}?startDate=${startDate}&endDate=${endDate}`,
                (signal = null),
            ),

        sendMailSearchReqData: (payload, topic) =>
            create(APP_SENDMAIL_URL, payload, topic),
    };

    return { api };
};

export default useApiClients;
