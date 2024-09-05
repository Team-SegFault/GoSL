import PropTypes from "prop-types";

const ApplicationDetailsPage = ({ applicationId }) => {
  return (
    <div>
      <h1>Application Details</h1>
      <p>Application ID: {applicationId}</p>
    </div>
  );
};

ApplicationDetailsPage.propTypes = {
  applicationId: PropTypes.string.isRequired,
};

export default ApplicationDetailsPage;
