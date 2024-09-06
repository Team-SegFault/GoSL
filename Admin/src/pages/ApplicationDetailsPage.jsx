import React from "react";
import { useLocation, useNavigate } from "react-router-dom";
import VisaApplication from "@/components/visa-application";
import useApplicationDetails from "@/components/visa-application/useApplicationViewModel";
import { Skeleton } from "@/components/ui/skeleton";
import DetailComponent from "@/components/dashboard/applicationDetails";

const ApplicationDetailsPage = () => {
  const location = useLocation();
  const navigate = useNavigate();
  const { applicationId } = location.state || {};

  // Use the custom hook
  const { loading, applicationData, error } =
    useApplicationDetails(applicationId);

  if (loading) {
    return (
      <div>
        <h1>Application Details</h1>
        <Skeleton /> {/* Display a skeleton loader while loading */}
      </div>
    );
  }

  return (
    <div>
      <h1>Application Details</h1>
      <p>Application ID: {applicationId}</p>
      {/* <VisaApplication data={applicationData} />{" "} */}
      <DetailComponent />
      {/* Pass the application data */}
    </div>
  );
};

export default ApplicationDetailsPage;
