import { BACKEND_HOST } from "../config/config";

export const BASE_URL = BACKEND_HOST;
export const LOGIN_URL = "auth/login";
export const USER_REGISTER_URL = "user/create";
export const REFRESH_TOKEN_URL = "auth/refresh-token";
export const OTP_VERIFICATION_URL = "auth/verify-otp";
export const PRESCRIPTION_UPLOAD_URL = "prescriptionupload/file-upload";
export const PRESCRIPTION_DOWNLOAD_URL = "prescriptionupload/download";
export const REQUEST_FOR_SMART_RX_URL =
    "prescriptionupload/update-smartrx-request/";
export const CREATE_NEW_FOLDER_URL = "folder/create-folder";
export const RENAME_FOLDER_URL = "folder/update-folder";
export const DELETE_FOLDER_URL = "folder/delete-folder";
export const FETCH_ALL_FOLDER_URL = "folder/GetAllFolders";
export const FETCH_BROWSE_RX_FOLDER_FILES_URL =
    "BrowseRx/getallparentfoldersandfiles";
export const MOVE_FILE_URL = "prescriptionupload/update-uploaded-file";
export const TAG_FILE_URL = "prescriptionupload/update-uploaded-file";
export const DELETE_FILE_URL = "prescriptionupload/delete-prescription";
export const FETCH_SMART_RX_INSIDER_URL =
    "SmartRxInsider/getsmartrxinsiderbyid";
export const FETCH_MEDICINE_LIST_COMPARE_URL =
    "SmartRxInsider/medicine-list-to-compare";
export const FETCH_TEST_LIST_COMPARE_URL =
    "SmartRxInsider/investigation-list-to-compare";
export const FETCH_DOCTOR_RECOMMENDED_OR_SELECTED_TEST_LIST_URL =
    "SmartRxInsider/investigation-list-selected-or-recommended";
export const FETCH_VITAL_URL = "Vital/GetVitalsByVitalName";
export const FETCH_INVESTIGATION_TEST_CENTERS_URL =
    "SmartRxInsider/investigation-testcenters";
export const EDIT_SMART_RX_INVESTIGATION_WISH_LIST_URL =
    "SmartRxInsider/edit-smartrx-investigation-wishlist";
export const EDIT_MEDICINE_FAVORITE_URL =
    "SmartRxInsider/edit-smartrx-medicine-wishlist";
export const EDIT_INVESTIGATION_TEST_CENTERS_URL =
    "SmartRxInsider/edit-smartrx-investigation-testcenters";
export const CREATE_NEW_VITAL_URL = "SmartRxInsider/add-smartrx-vital";
export const EDIT_VITAL_URL = "SmartRxInsider/edit-smartrx-vital";
export const DELETE_VITAL_URL = "SmartRxInsider/add-smartrx-vital";

export const FETCH_DOCTOR_PROFILE_URL =
    "Doctor/GetDoctorDetialsById";
export const FETCH_DOCTOR_PROFILE_LIST_URL =
    "Doctor/GetDoctorProfilesByUserId";

export const FETCH_PATIENT_PROFILE_URL =
    "PatientProfile/GetPatientDetialsById";
export const UPDATE_PATIENT_PROFILE_URL =
    "PatientProfile/UpdatePatientInfo/{id}";
export const CREATE_PATIENT_PROFILE_URL = "PatientProfile/CreatePatientProfile";

export const UPDATE_DOCTOR_REVIEW_URL = "SmartRxInsider/change-smartrx-doctor-review";

export const FETCH_USER_URL = "user";
export const PAGINATED_ROLE_URL = "roles/page";
export const ROLE_URL = "roles";
export const ROLE_ASSIGN_URL = "/users/";
export const FUNCTION_URL = "functions";
export const USER_URL = "users";
export const AD_USER_URL = "users/get-aduser";
export const PAGINATED_USER_URL = "users/page";
export const WHITE_LIST_URL = "whitelist-numbers";
export const PAGINATED_WHITE_LIST_URL = "whitelist-numbers/page";
export const FUNCTION_ASSIGN_URL = "roles/functions";
export const SPECIAL_NUMBERS_URL = "special-numbers";
export const PAGINATED_SPECIAL_NUMBERS_URL = "special-numbers/page";
export const SEARCH_REQUEST_URL = "search-request";
export const AUTHORITIES_URL = "users/authorities";
export const SOFT_DELETE_WHITELIST_URL = "whitelist-numbers";
export const APP_AUDIT_URL = "app-audit/page";
export const APP_SEARCH_APPROVAL_URL = "search-request/pendingForApproval";
export const APP_SEARCH_REQ_STATUS_URL = "search-request/update-status";
export const APP_SEARCH_REQ_DOWNLOAD_URL = "search-request";
export const APP_SEARCH_REQ_FILTER_URL = "search-request/filter";
export const APP_NOTIFICATION_URL = "notifications";
export const APP_CDR_URL = "cdr";
export const APP_ESAF_VIEW_URL = "search-request/request";
export const APP_SMS_VIEW_URL = "search-request/sms";
export const APP_SMS_REPORT_URL = "sms/report";
export const APP_EMAIL_REPORT_URL = "email-reports";
export const NOT_DOWNLOADED_SEARCH_REQUEST_URL = "search-request/notdownloaded";
export const APP_NTMC_REPORT_URL = "service-request-reports";
export const APP_SENDMAIL_URL = "send-email";
export const FETCH_MEDICINE_FAQ_URL = "SmartRxInsider/medicine-faq-list";
export const FETCH_INVESTIGATION_FAQ_URL = "SmartRxInsider/investigation-faq-list";
export const FETCH_VITAL_FAQ_URL = "SmartRxInsider/vital-faq-list";
export const DELETE_SMARTRX_VITAL_BY_ID_URL = "SmartRxInsider/smartrx-vital-delete";
export const FETCH_PATIENT_OR_RELATIVE_DROPDOWN_URL = "PatientProfile/GetPatientDropdown";
export const FETCH_PATIENT_PROFILE_LIST_URL = "PatientProfile/GetAllPatientProfilesByUserId";
export const FETCH_PATIENT_VITAL_LIST_URL =
    "SmartRxInsider/GetAllSmartRxWithVitalsByUserId";
export const FETCH_PATIENT_PRESCRIPTIONS_URL = "BrowseRx/getpatientprescriptions";
export const FETCH_PATIENT_PRESCRIPTIONS_BY_TYPE_URL = "BrowseRx/getpatientprescriptionsbytype";
// Dashboard summary
export const DASHBOARD_SUMMARY_URL = "dashboard/dashboard-summary";
