import {
  Pagination,
  PaginationContent,
  PaginationEllipsis,
  PaginationItem,
  PaginationLink,
  PaginationNext,
  PaginationPrevious,
} from "@/components/ui/pagination";
import { cn } from "@/lib/utils";
import { useEffect, useState } from "react";

export const Paginator = ({
  previousPage,
  nextPage,
  totalPageCount,
  goToPage,
}) => {
  const [currentPage, setCurrentPage] = useState(1);
  // page numbers to display
  const [pageNumbers, setPageNumbers] = useState([]);

  // initialize page numbers to display on mount and when totalPageCount changes
  useEffect(() => {
    // if totalPageCount is less than 5, display all page numbers
    // else display 5 page numbers at a time (-2 and +2 from current page)
    if (totalPageCount <= 5) {
      setPageNumbers(
        Array.from({ length: totalPageCount }, (_, index) => index + 1),
      );
      return;
    }

    // -2 and +2 from current page
    const start = Number.min(currentPage - 2, 1);
    const end = Number.max(currentPage + 2, totalPageCount);
    const length = Number.min(end - start + 1, 5);
    setPageNumbers(Array.from({ length }, (_, index) => start + index));
  }, [totalPageCount, currentPage]);

  return (
    <Pagination>
      <PaginationContent>
        <PaginationItem
          className="cursor-pointer"
          disabled={currentPage === 1}
          onClick={() => {
            if (currentPage == 1) return;
            previousPage();
            setCurrentPage((prev) => prev - 1);
          }}
        >
          <PaginationPrevious />
        </PaginationItem>

        {pageNumbers.map((pageNumber) => {
          return (
            <PaginationItem key={pageNumber}>
              <PaginationLink isActive={pageNumber == currentPage}>
                {pageNumber}
              </PaginationLink>
            </PaginationItem>
          );
        })}
        <PaginationItem
          className="cursor-pointer"
          onClick={() => {
            if (currentPage == totalPageCount) return;
            nextPage();
            setCurrentPage((prev) => prev + 1);
          }}
        >
          <PaginationNext />
        </PaginationItem>
      </PaginationContent>
    </Pagination>
  );
};
