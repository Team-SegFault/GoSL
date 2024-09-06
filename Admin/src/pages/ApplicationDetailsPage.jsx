// import React from "react";
import PropTypes from "prop-types";
import { useLocation } from "react-router-dom";
// import VisaApplication from "@/components/visa-application";
// import useApplicationDetails from "@/components/visa-application/useApplicationViewModel";
// import { Skeleton } from "@/components/ui/skeleton";
import DetailComponent from "@/components/dashboard/applicationDetails";

const ApplicationDetailsPage = () => {
  const location = useLocation();
  const { applicationData } = location.state || {};

  return (
    <div style={{ padding: 20 }}>
      {/* <VisaApplication data={applicationData} />{" "} */}
      <DetailComponent applicationData={applicationData} />
      {/* Pass the application data */}
    </div>
  );
};

ApplicationDetailsPage.propTypes = {
  applicationData: PropTypes.object,
};

export default ApplicationDetailsPage;
