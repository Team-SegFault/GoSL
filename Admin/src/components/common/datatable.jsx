import {
  flexRender,
  getCoreRowModel,
  useReactTable,
  getFilteredRowModel,
  getPaginationRowModel,
  getSortedRowModel,
} from "@tanstack/react-table";
import {
  Table,
  TableBody,
  TableCell,
  TableHead,
  TableHeader,
  TableRow,
} from "@/components/ui/table";
import { useState } from "react";
import { Button } from "@/components/ui/button";
import { Input } from "@/components/ui/input";
import { DatePicker } from "./datepicker";
import moment from "moment";
import { Paginator } from "./pagination";

// eslint-disable-next-line react/prop-types
export function DataTable({ columns, data, onRowClick }) {
  const [sorting, setSorting] = useState([]);
  const [columnFilters, setColumnFilters] = useState([]);

  const table = useReactTable({
    data,
    columns,
    getCoreRowModel: getCoreRowModel(),
    getPaginationRowModel: getPaginationRowModel(),
    onSortingChange: setSorting,
    getSortedRowModel: getSortedRowModel(),
    onColumnFiltersChange: setColumnFilters,
    getFilteredRowModel: getFilteredRowModel(),
    state: {
      sorting,
      columnFilters,
    },
  });

  return (
    <div>
      <div className="flex items-center py-4">
        <div className="flex gap-2 justify-end w-full">
          <Input
            placeholder="Search Country..."
            value={table.getColumn("country")?.getFilterValue() ?? ""}
            onChange={(event) =>
              table.getColumn("country")?.setFilterValue(event.target.value)
            }
            className="max-w-sm"
          />
          <DatePicker
            date={table.getColumn("date")?.getFilterValue() ?? null}
            setDate={(date) => {
              table
                .getColumn("date")
                ?.setFilterValue(
                  date ? moment(date).format("YYYY-MM-DD") : undefined,
                );
            }}
          />
          <Button
            variant="secondary"
            onClick={() => {
              table.resetColumnFilters();
            }}
          >
            Reset Filters
          </Button>
        </div>
      </div>
      <div className="rounded-md border">
        <Table>
          <TableHeader>
            {table.getHeaderGroups().map((headerGroup) => (
              <TableRow key={headerGroup.id}>
                {headerGroup.headers.map((header) => {
                  return (
                    <TableHead key={header.id}>
                      {header.isPlaceholder
                        ? null
                        : flexRender(
                            header.column.columnDef.header,
                            header.getContext(),
                          )}
                    </TableHead>
                  );
                })}
              </TableRow>
            ))}
          </TableHeader>
          <TableBody>
            {table.getRowModel().rows?.length ? (
              table.getRowModel().rows.map((row) => (
                <TableRow
                  onClick={() => {
                    onRowClick(row);
                  }}
                  className="hover:cursor-pointer"
                  key={row.id}
                  data-state={row.getIsSelected() && "selected"}
                >
                  {row.getVisibleCells().map((cell) => (
                    <TableCell key={cell.id}>
                      {flexRender(
                        cell.column.columnDef.cell,
                        cell.getContext(),
                      )}
                    </TableCell>
                  ))}
                </TableRow>
              ))
            ) : (
              <TableRow>
                <TableCell
                  colSpan={columns.length}
                  className="h-24 text-center"
                >
                  No results.
                </TableCell>
              </TableRow>
            )}
          </TableBody>
        </Table>
      </div>
      <div className="flex items-center justify-end py-4">
        <Paginator
          previousPage={() => table.previousPage()}
          nextPage={() => table.nextPage()}
          totalPageCount={table.getPageCount()}
          goToPage={(pageNumber) => table.setPageIndex(pageNumber)}
        />
      </div>
    </div>
  );
}
