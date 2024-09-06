import { useState, useEffect } from "react";

const useApplicationDetails = (applicationId) => {
  const [loading, setLoading] = useState(true);
  const [applicationData, setApplicationData] = useState(null);
  const [error, setError] = useState(null);

  useEffect(() => {
    if (!applicationId) {
      setError("Invalid Application ID");
      setLoading(false);
      return;
    }

    const fetchApplicationData = async () => {
      try {
        throw new Error("Not implemented");
      } catch (err) {
        if (err.response && err.response.status === 404) {
          setError("Application not found (404)");
        } else {
          setError("An error occurred while fetching the application");
        }
      } finally {
        setLoading(false);
      }
    };

    fetchApplicationData();
  }, [applicationId]);

  return { loading, applicationData, error };
};

export default useApplicationDetails;
