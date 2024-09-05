import PropTypes from "prop-types";

const ApprovalPage = ({ applicationId }) => {
  return (
    <div>
      <h1>Approval Page</h1>
      <p>Application ID: {applicationId}</p>
    </div>
  );
};

ApprovalPage.propTypes = {
  applicationId: PropTypes.string.isRequired,
};

export default ApprovalPage;
