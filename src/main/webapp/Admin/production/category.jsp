<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<!DOCTYPE html>
<html>
<body>
<div class="clearfix"></div>
<div class="row">
    <div class="col-md-12 col-sm-12">
        <div class="x_panel">
            <div class="x_title">
                <h2>Danh Sách</h2>
                <!-- Button trigger modal -->
                <button type="button" class="btn btn-primary float-end mr-3 px-5"
                        data-bs-toggle="modal" data-bs-target="#them">Thêm
                </button>
                <!-- Modal -->
                <div div class="modal fade" id="them" tabindex="-1"
                     aria-labelledby="themLabel" aria-hidden="true">
                    <div class="modal-dialog modal-lg">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h1 class="modal-title fs-5" id="themLabel">Thêm màu mới</h1>
                                <button type="button" class="btn-close" data-bs-dismiss="modal"
                                        aria-label="Close"></button>
                            </div>
                            <div class="modal-body">
                                <div id="createFormContainer">
                                    <form class="form-horizontal form-label-left"
                                          method="POST" action="/admin/category/create"
                                          id="createForm">
                                        <div class="form-group">
                                            <label class="control-label">Tên danh mục</label>
                                            <input name="NAME" class="form-control"
                                                   placeholder=""/>
                                        </div>
                                        <div class="modal-footer">
                                            <button type="button" class="btn btn-secondary"
                                                    data-bs-dismiss="modal">Close
                                            </button>
                                            <button type="submit" class="btn btn-primary">Create</button>
                                        </div>
                                    </form>
                                </div>
                            </div>

                        </div>
                    </div>
                </div>
                <div class="clearfix"></div>
            </div>
            <div class="x_content">
                <div class="row">
                    <div class="col-sm-12">
                        <div class="card-box table-responsive">
                            <table id="datatable-responsive"
                                   class="table table-striped table-bordered dt-responsive nowrap"
                                   cellspacing="0" width="100%">
                                <thead>
                                <tr>
                                    <th>Số thứ tự</th>
                                    <th>Tên danh mục</th>
                                    <th class="text-center">Hoạt động</th>
                                </tr>
                                </thead>
                                <tbody>
                                <c:forEach var="entry" items="${list_category}" varStatus="loop">
                                    <tr>
                                        <td>${loop.index +1}</td>
                                        <td>${entry.value}</td>
                                        <td class="text-center">
                                            <i data-bs-toggle="modal" data-bs-target="#updateModel${entry.key}"
                                               class="fa-solid fa-pen-to-square fs-4 mr-3"></i>
                                            <i data-bs-toggle="modal" data-bs-target="#delete${entry.key}"
                                               class="fa-solid fa-trash fs-4"></i>
                                        </td>
                                    </tr>
                                    <!-- Modal Delete -->
                                    <div class="modal fade" id="delete${entry.key}" tabindex="-1"
                                         aria-labelledby="deleteLabel" aria-hidden="true">
                                        <div class="modal-dialog">
                                            <div class="modal-content">
                                                <div class="modal-header">
                                                    <h1 class="modal-title fs-5" id="deleteLabel">Xác nhận xóa</h1>
                                                    <button type="button" class="btn-close"
                                                            data-bs-dismiss="modal" aria-label="Close"></button>
                                                </div>
                                                <div class="modal-body text-left" id="thongbao">
                                                    Bạn có chắc muốn xóa danh mục "${entry.value}" không ?
                                                </div>
                                                <div class="modal-footer">
                                                    <button type="button" class="btn btn-secondary"
                                                            data-bs-dismiss="modal">
                                                        Close
                                                    </button>
                                                    <a class="btn btn-danger" id="deleteButton" href="/admin/category/delete/${entry.key}">
                                                        Delete
                                                    </a>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <!-- Modal Update -->
                                    <div class="modal fade" id="updateModel${entry.key}" tabindex="-1"
                                         aria-labelledby="updateLabel" aria-hidden="true">
                                        <div class="modal-dialog">
                                            <div class="modal-content">
                                                <div class="modal-header">
                                                    <h1 class="modal-title fs-5" id="updateLabel">Cập nhật</h1>
                                                    <button type="button" class="btn-close"
                                                            data-bs-dismiss="modal" aria-label="Close"></button>
                                                </div>
                                                <div class="modal-body">
                                                    <form class="form-horizontal form-label-left"
                                                          method="POST"
                                                          action="/admin/category/update">
                                                        <div class="row text-left">
                                                            <div class="form-group">
                                                                <input id="categoryId" value="${entry.key}"
                                                                       name="ID" type="hidden" class="form-control"/>
                                                            </div>
                                                            <div class="form-group">
                                                                <label class="control-label">Tên danh mục</label>
                                                                <input id="categoryName" name="NAME" type="text"
                                                                       class="form-control" value="${entry.value}"/>
                                                            </div>
                                                        </div>
                                                        <div class="modal-footer">
                                                            <button type="button" class="btn btn-secondary"
                                                                    data-bs-dismiss="modal">Close
                                                            </button>
                                                            <button type="submit" class="btn btn-primary">Update
                                                            </button>
                                                        </div>
                                                    </form>
                                                </div>

                                            </div>
                                        </div>
                                    </div>
                                </c:forEach>
                                </tbody>
                            </table>

                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
</html>
