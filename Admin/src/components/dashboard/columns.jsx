import { StatusBadge } from "./status-badge";

const columns = [
  {
    header: "Name",
    accessorKey: "name",
  },
  {
    header: "Submission Date",
    accessorKey: "date",
  },
  {
    header: "Country",
    accessorKey: "country",
  },
  {
    header: "Status",
    accessorKey: "status",
    cell: ({ row }) => {
      const status = row.getValue("status");
      console.log("status", status);
      return <StatusBadge status={status} />;
    },
  },
];

export default columns;
