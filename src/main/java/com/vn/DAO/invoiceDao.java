package com.vn.DAO;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.vn.entity.color;
import com.vn.entity.invoice;
import com.vn.entity.system;

public interface invoiceDao extends JpaRepository<invoice, Integer> {
	@Query("select sum(i.TOTAL_AMOUNT) from invoice i where i.status_invoice.ID = 1")
	long sumRevenue();
	@Query(value = "DECLARE @Year INT = :year; DECLARE @Month INT = :month; " +
            "WITH AllDays AS ( " +
            "SELECT DATEADD(DAY, N-1, DATEFROMPARTS(@Year, @Month, 1)) AS OrderDate " +
            "FROM ( " +
            "SELECT TOP (DAY(EOMONTH(DATEFROMPARTS(@Year, @Month, 1)))) ROW_NUMBER() OVER (ORDER BY s1.object_id) AS N " +
            "FROM sys.all_objects AS s1 CROSS JOIN sys.all_objects AS s2 ) AS Numbers ) " +
            "SELECT ISNULL(SUM(o.TOTAL_AMOUNT), 0) AS TotalPrice " +
            "FROM AllDays d " +
            "LEFT JOIN INVOICE o ON CAST(o.UPDATE_AT AS DATE) = d.OrderDate AND o.ID_STATUS = 1" +
            "GROUP BY d.OrderDate ORDER BY d.OrderDate", nativeQuery = true)
List<Double> getTotalPricePerDay(@Param("year") int year, @Param("month") int month);
}
