package com.vn.DAO;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.vn.entity.color;
import com.vn.entity.invoice;
import com.vn.entity.system;
import org.springframework.stereotype.Repository;

@Repository
public interface invoiceDao extends JpaRepository<invoice, Integer> {
	@Query("select sum(i.TOTAL_AMOUNT) from invoice i where i.status_invoice.ID = 1")
	Long sumRevenue();
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
		@Query(value = "DECLARE @Year INT = :year; DECLARE @Month INT = :month; DECLARE @Day INT = :day; " +
            "DECLARE @CurrentDate DATETIME = DATEFROMPARTS(@Year, @Month, @Day); " +
            "WITH AllHours AS ( " +
            "    SELECT DATEADD(HOUR, n, @CurrentDate) AS HourStart " +
            "    FROM (SELECT TOP (24) ROW_NUMBER() OVER (ORDER BY s1.object_id) - 1 AS n " +
            "          FROM sys.all_objects AS s1 CROSS JOIN sys.all_objects AS s2) AS Numbers " +
            ") " +
            "SELECT ISNULL(SUM(i.TOTAL_AMOUNT), 0) AS TotalAmount " +
            "FROM AllHours ah " +
            "LEFT JOIN INVOICE i ON i.ID_STATUS = 1 " +
            "              AND i.UPDATE_AT >= ah.HourStart " +
            "              AND i.UPDATE_AT < DATEADD(HOUR, 1, ah.HourStart) " +
            "GROUP BY " +
            "    DATEPART(HOUR, ah.HourStart) " +
            "ORDER BY " +
            "    DATEPART(HOUR, ah.HourStart);", nativeQuery = true)
List<Double> getTotalAmountPerHour(@Param("year") int year, @Param("month") int month, @Param("day") int day);

	@Query(value = "DECLARE @Year INT = :year; " +
            "WITH AllMonths AS ( " +
            "    SELECT 1 AS MonthNumber " +
            "    UNION ALL " +
            "    SELECT MonthNumber + 1 " +
            "    FROM AllMonths " +
            "    WHERE MonthNumber < 12 " +
            ") " +
            "SELECT ISNULL(SUM(i.TOTAL_AMOUNT), 0) AS TotalAmount " +
            "FROM AllMonths m " +
            "LEFT JOIN INVOICE i ON MONTH(i.UPDATE_AT) = m.MonthNumber " +
            "                  AND YEAR(i.UPDATE_AT) = @Year " +
            "                  AND i.ID_STATUS = 1 " +
            "GROUP BY m.MonthNumber " +
            "ORDER BY m.MonthNumber", nativeQuery = true)
List<Double> getTotalPricePerMonth(@Param("year") int year);

}
