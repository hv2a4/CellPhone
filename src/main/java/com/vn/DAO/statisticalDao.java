package com.vn.DAO;

import java.util.List;

import org.springframework.data.jpa.repository.Query;

import com.vn.entity.phone;

public interface statisticalDao {
// @Query("SELECT TOP 5 \n"
// 		+ "    a.ID,a.NAME,a.screen_resolution.getId(),a.RAM,a.BATTERY_CAPACITY,a.REFRESH_RATE,a.brand.getId() \n"
// 		+ "FROM \n"
// 		+ "    phone a \n"
// 		+ "INNER JOIN \n"
// 		+ "    variant b ON a.phone.ID = b.ID \n"
// 		+ "INNER JOIN \n"
// 		+ "    order_item c ON b.variant.ID = c.ID \n"
// 		+ "INNER JOIN \n"
// 		+ "    order d ON c.order.ID = d.ID\n"
// 		+ "INNER JOIN \n"
// 		+ "    status_order e ON d.ID = e.order.ID \n"
// 		+ "where e.STATUS = 1 \n"
// 		+ "GROUP BY \n"
// 		+ "   a.ID,a.NAME,a.screen_resolution.getId(),a.RAM,a.BATTERY_CAPACITY,a.REFRESH_RATE,a.brand.getId() \n"
// 		+ " \n"
// 		+ "ORDER BY \n"
// 		+ "    SUM(c.QUANTITY) DESC")
// 	List<phone> FinByTop5();
}
