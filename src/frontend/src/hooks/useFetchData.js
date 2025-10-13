import axios from "axios";
import { useState, useEffect, useRef } from "react";

/**
 * Custom hook to fetch data from an API with loading and error handling.
 *
 * @param {function} apiCall - Function to make the API call. It should return a promise that resolves with the response.
 *
 * @returns {object} - Returns an object containing the fetched data, loading state, and any error that occurred.
 *
 * @example
 * const { data, isLoading, error } = useFetchData(apiCall, "/api/data");
 */
export const useFetchData = (
    apiCall,
    page,
    rowsPerPage,
    sortField,
    sortOrder,
    payload,
    searchQuery
) => {
    // State to store the fetched data
    const [data, setData] = useState([]);

    // State to track whether the API request is in progress
    const [isLoading, setIsLoading] = useState(false);

    // State to store any error that occurs during the API request
    const [error, setError] = useState(null);

    // Ref to hold the AbortController instance
    const abortControllerRef = useRef(new AbortController());

    // Ref to track if the component is mounted for the first time
    const isInitialMount = useRef(true);

    /**
     * useEffect hook to trigger the data fetch when the component mounts or the URL changes.
     * Function to fetch data from the provided API.
     * It sets loading state, handles successful response, and catches any errors.
     */
    useEffect(() => {
        if (isInitialMount.current) {
            // Prevent double invocation on initial mount
            isInitialMount.current = false;
            // IIFE to fetch data when the component mounts or the URL changes
            (async () => {
                // Get the signal from the AbortController
                const { signal } = abortControllerRef.current;

                try {
                    // Set loading state to true while fetching data
                    setIsLoading(true);

                    // Make the API call, passing the signal to allow cancellation
                    let response;
                    if (payload) {
                        response = await apiCall(signal, payload);
                    } else if (page || rowsPerPage || sortField || sortOrder) {
                        response = await apiCall(
                            signal,
                            page,
                            rowsPerPage,
                            sortField,
                            sortOrder
                        );
                    }

                    // Check if the response is successful and contains valid data
                    if (response && response.message === "Successful") {
                        // Update the data state with the API response
                        setData(response.response);
                    } else {
                        // If the response structure is invalid, throw an error
                        setData([]);
                        // throw new Error(
                        //     "Invalid response structure or no data available"
                        // );
                    }
                } catch (err) {
                    if (axios.isCancel(err)) {
                        console.log("Request Canceled");
                        return;
                    }
                    setError(err);
                } finally {
                    // Always set loading state to false after request completes
                    setIsLoading(false);
                    isInitialMount.current = true;
                }

                // Cleanup function to abort the request when the component unmounts or the URL changes
                return () => {
                    abortControllerRef.current.abort();
                };
            })();
        }
    }, [page, rowsPerPage, sortField, sortOrder, searchQuery]);

    // Separate effect to handle payload changes
    useEffect(() => {
        if (!isInitialMount.current && payload) {
            // Only refetch if not initial mount and payload exists
            refetch();
        }
    }, [payload]);

    /**
     * Asynchronously fetches data from the API and updates the state accordingly.
     * Handles errors and ensures the response structure is valid before updating state.
     */
    const refetch = async () => {
        try {
            // Make the API call to the specified URL
            let response;
            if (payload) {
                response = await apiCall("", payload);
            } else {
                response = await apiCall(
                    "",
                    page,
                    rowsPerPage,
                    sortField,
                    sortOrder
                );
            }
            if (response && response.message === "Successful") {
                // Update the data state with the API response data
                setData(response.response);
            } else {
                // Response structure is valid but no data is available
                setData([]);
                // Log a warning message and throw an error for no data condition
                console.warn("No data available in the response.");
                throw new Error("No data available");
            }
        } catch (err) {
            // Log the error for debugging purposes and update the error state
            console.error("Error fetching data:", err);
            setError(err);
        }
    };

    // Return the data, loading state, and error state to be used by the component
    return { data, isLoading, error, refetch };
};
