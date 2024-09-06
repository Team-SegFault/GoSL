import { useState, useEffect } from "react";

const useApplicationDetails = () => {
  const [loading, setLoading] = useState(true);
  const [applicationData, setApplicationData] = useState(null);
  const [error, setError] = useState(null);

  useEffect(() => {
    const fetchApplicationData = async () => {
      try {
        // Fetch application data
        const response = await fetch(
          "http://gosl.lakindu.me/api/visa-applications/"
        );
        if (response.status === 200) {
          const data = await response.json();
          setApplicationData(data);
        }
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
  }, []);

  return { loading, applicationData, error };
};

export default useApplicationDetails;
