<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <div class="container">
            <div class="row">
                <div class="col-md-12 tb">
                    <ul class="nav nav-tabs" id="myTab" role="tablist">
                        <li role="presentation" class="active">
                            <a href="#home-tab-pane" id="home-tab"
                                data-toggle="tab" role="tab"
                                aria-controls="home-tab-pane"
                                aria-selected="true">Tất cả đơn hàng</a>
                        </li>
                        <li role="presentation">
                            <a href="#profile-tab-pane" id="profile-tab"
                                data-toggle="tab" role="tab"
                                aria-controls="profile-tab-pane"
                                aria-selected="false">Chờ xác nhận</a>
                        </li>
                        <li role="presentation">
                            <a href="#contact-tab-pane" id="contact-tab"
                                data-toggle="tab" role="tab"
                                aria-controls="contact-tab-pane"
                                aria-selected="false">Đã xác nhận</a>
                        </li>
                        <li role="presentation">
                            <a href="#dangvanchuyen" id="dangvanchuyen-tab"
                                data-toggle="tab" role="tab"
                                aria-controls="dangvanchuyen"
                                aria-selected="false">Đang vận chuyển</a>
                        </li>
                        <li role="presentation">
                            <a href="#hoanthanh" id="hoanthanh-tab"
                                data-toggle="tab" role="tab"
                                aria-controls="hoanthanh"
                                aria-selected="false">Hoàn thành</a>
                        </li>
                        <li role="presentation">
                            <a href="#dahuy" id="dahuy-tab" data-toggle="tab"
                                role="tab" aria-controls="dahuy"
                                aria-selected="false">Đã hủy</a>
                        </li>
                    </ul>
                    <div class="tab-content" id="myTabContent">
                        <!-- Tất cả đơn hàng -->
                        <div class="tab-pane fade in active" id="home-tab-pane"
                            role="tabpanel" aria-labelledby="home-tab">
                            <div class="card mt-3">
                                <div class="card-header">
                                    <h2 class="card-title">Danh Sách</h2>
                                </div>
                                <div class="card-body">
                                    <div class="table-responsive">
                                        <table
                                            class="table table-striped table-bordered">
                                            <thead>
                                                <tr>
                                                    <th>Mã đơn hàng</th>
                                                    <th>Tên người đặt</th>
                                                    <th>Tổng tiền</th>
                                                    <th>Ngày đặt</th>
                                                    <th>Trạng thái</th>
                                                    <th>Hoạt động</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <tr>
                                                    <td>001</td>
                                                    <td>Nguyen Van A</td>
                                                    <td>27346342</td>
                                                    <td>19-05-2024</td>
                                                    <td>Chờ xác nhận</td>
                                                    <td><button type="button"
                                                            class="btn btn-danger">Hủy</button></td>
                                                </tr>
                                                <tr>
                                                    <td>002</td>
                                                    <td>Nguyen Van A</td>
                                                    <td>27346342</td>
                                                    <td>19-05-2024</td>
                                                    <td>Xác nhận</td>
                                                    <td><button type="button"
                                                            class="btn btn-danger">Hủy</button></td>
                                                </tr>
                                                <tr>
                                                    <td>003</td>
                                                    <td>Nguyen Van A</td>
                                                    <td>27346342</td>
                                                    <td>19-05-2024</td>
                                                    <td>Đang vận chuyển</td>
                                                    <td><button type="button"
                                                            class="btn btn-danger">Hủy</button></td>
                                                </tr>
                                                <tr>
                                                    <td>004</td>
                                                    <td>Nguyen Van A</td>
                                                    <td>27346342</td>
                                                    <td>19-05-2024</td>
                                                    <td>Chờ xác nhận</td>
                                                    <td><button type="button"
                                                            class="btn btn-danger">Hủy</button></td>
                                                </tr>
                                                <tr>
                                                    <td>005</td>
                                                    <td>Nguyen Van A</td>
                                                    <td>27346342</td>
                                                    <td>19-05-2024</td>
                                                    <td>Xác nhận</td>
                                                    <td><button type="button"
                                                            class="btn btn-danger">Hủy</button></td>
                                                </tr>
                                                <tr>
                                                    <td>006</td>
                                                    <td>Nguyen Van A</td>
                                                    <td>27346342</td>
                                                    <td>19-05-2024</td>
                                                    <td>Đang vận chuyển</td>
                                                    <td><button type="button"
                                                            class="btn btn-danger">Hủy</button></td>
                                                </tr>
                                            </tbody>
                                        </table>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <!-- Chờ xác nhận -->
                        <div class="tab-pane fade" id="profile-tab-pane"
                            role="tabpanel" aria-labelledby="profile-tab"
                            tabindex="0">
                            <div class="card mt-3">
                                <div class="card-header">
                                    <h2 class="card-title">Danh Sách</h2>
                                </div>
                                <div class="card-body">
                                    <div class="table-responsive">
                                        <table
                                            class="table table-striped table-bordered">
                                            <thead>
                                                <tr>
                                                    <th>Mã đơn hàng</th>
                                                    <th>Tên người đặt</th>
                                                    <th>Tổng tiền</th>
                                                    <th>Ngày đặt</th>
                                                    <th>Trạng thái</th>
                                                    <th>Hoạt động</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <tr>
                                                    <td>001</td>
                                                    <td>Nguyen Van A</td>
                                                    <td>27346342</td>
                                                    <td>19-05-2024</td>
                                                    <td>Chờ xác nhận</td>
                                                    <td><button type="button"
                                                            class="btn btn-danger">Hủy</button></td>
                                                </tr>
                                            </tbody>
                                        </table>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <!-- Đã xác nhận -->
                        <div class="tab-pane fade" id="contact-tab-pane"
                            role="tabpanel" aria-labelledby="contact-tab"
                            tabindex="0">
                            <div class="card mt-3">
                                <div class="card-header">
                                    <h2 class="card-title">Danh Sách</h2>
                                </div>
                                <div class="card-body">
                                    <div class="table-responsive">
                                        <table
                                            class="table table-striped table-bordered">
                                            <thead>
                                                <tr>
                                                    <th>Mã đơn hàng</th>
                                                    <th>Tên người đặt</th>
                                                    <th>Tổng tiền</th>
                                                    <th>Ngày đặt</th>
                                                    <th>Trạng thái</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <tr>
                                                    <td>001</td>
                                                    <td>Nguyen Van A</td>
                                                    <td>27346342</td>
                                                    <td>19-05-2024</td>
                                                    <td>Đã xác nhận</td>
                                                </tr>
                                            </tbody>
                                        </table>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <!-- Đang vận chuyển -->
                        <div class="tab-pane fade" id="dangvanchuyen"
                            role="tabpanel" aria-labelledby="dangvanchuyen-tab"
                            tabindex="0">
                            <div class="card mt-3">
                                <div class="card-header">
                                    <h2 class="card-title">Danh Sách</h2>
                                </div>
                                <div class="card-body">
                                    <div class="table-responsive">
                                        <table
                                            class="table table-striped table-bordered">
                                            <thead>
                                                <tr>
                                                    <th>Mã đơn hàng</th>
                                                    <th>Tên người đặt</th>
                                                    <th>Tổng tiền</th>
                                                    <th>Ngày đặt</th>
                                                    <th>Trạng thái</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <tr>
                                                    <td>001</td>
                                                    <td>Nguyen Van A</td>
                                                    <td>27346342</td>
                                                    <td>19-05-2024</td>
                                                    <td>Đang vận chuyển</td>
                                                </tr>
                                            </tbody>
                                        </table>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <!-- Hoàn thành -->
                        <div class="tab-pane fade" id="hoanthanh"
                            role="tabpanel" aria-labelledby="hoanthanh-tab"
                            tabindex="0">
                            <div class="card mt-3">
                                <div class="card-header">
                                    <h2 class="card-title">Danh Sách</h2>
                                </div>
                                <div class="card-body">
                                    <div class="table-responsive">
                                        <table
                                            class="table table-striped table-bordered">
                                            <thead>
                                                <tr>
                                                    <th>Mã đơn hàng</th>
                                                    <th>Tên người đặt</th>
                                                    <th>Tổng tiền</th>
                                                    <th>Ngày đặt</th>
                                                    <th>Trạng thái</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <tr>
                                                    <td>001</td>
                                                    <td>Nguyen Van A</td>
                                                    <td>27346342</td>
                                                    <td>19-05-2024</td>
                                                    <td>Hoàn thành</td>
                                                </tr>
                                            </tbody>
                                        </table>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <!-- Đã hủy -->
                        <div class="tab-pane fade" id="dahuy" role="tabpanel"
                            aria-labelledby="dahuy-tab" tabindex="0">
                            <div class="card mt-3">
                                <div class="card-header">
                                    <h2 class="card-title">Danh Sách</h2>
                                </div>
                                <div class="card-body">
                                    <div class="table-responsive">
                                        <table
                                            class="table table-striped table-bordered">
                                            <thead>
                                                <tr>
                                                    <th>Mã đơn hàng</th>
                                                    <th>Tên người đặt</th>
                                                    <th>Tổng tiền</th>
                                                    <th>Ngày đặt</th>
                                                    <th>Lý do</th>
                                                    <th>Hoạt động</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <tr>
                                                    <td>001</td>
                                                    <td>Nguyen Van A</td>
                                                    <td>27346342</td>
                                                    <td>19-05-2024</td>
                                                    <td>Sai màu rồi</td>
                                                    <td><button type="button"
                                                            class="btn btn-success">Mua
                                                            lại</button></td>
                                                </tr>
                                            </tbody>
                                        </table>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>