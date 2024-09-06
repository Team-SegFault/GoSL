import { Badge } from "@/components/ui/badge";
import { ApplicationStatus } from "@/lib/status.enum";
const StatusBadge = ({ status }) => {
  if (status === ApplicationStatus.Pending) {
    return <Badge variant="yellow">Pending</Badge>;
  }

  if (status === ApplicationStatus.UnderReview) {
    return <Badge variant="blue">Under Review</Badge>;
  }

  if (status === ApplicationStatus.Approved) {
    return <Badge variant="green">Approved</Badge>;
  }

  if (status === ApplicationStatus.Denied) {
    return <Badge variant="red">Denied</Badge>;
  }

  return null;
};

export { StatusBadge };
