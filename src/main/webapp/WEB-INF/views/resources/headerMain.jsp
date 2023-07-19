<%--
  Created by IntelliJ IDEA.
  User: jessika
  Date: 16.07.2023
  Time: 13:03
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html lang="en">

<head>

  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">

  <title>Truck Company Page</title>

  <!-- Custom fonts for this template-->
  <link href="<c:url value="/vendor/fontawesome-free/css/all.min.css"/>" rel="stylesheet" type="text/css">
  <link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">

  <!-- Custom styles for this template-->
  <link href="<c:url value="/css/sb-admin-2.css"/>" rel="stylesheet">

</head>

<body id="page-top">

<!-- Page Wrapper -->
<div id="wrapper">

  <!-- Sidebar -->
  <ul class="navbar-nav bg-gradient-primary sidebar sidebar-dark accordion" id="accordionSidebar">

    <!-- Sidebar - Brand -->
    <a class="sidebar-brand d-flex align-items-center justify-content-center" href="/user/mainpage">
      <div class="sidebar-brand-icon rotate-n-15">
        <i class="fas fa-laugh-wink"></i>
      </div>
      <div class="sidebar-brand-text mx-3">Truck Company <sup>project</sup></div><br>
    </a>

    <!-- Divider -->
    <hr class="sidebar-divider my-0">

    <!-- Nav Item - Dashboard -->
    <li class="nav-item active">
      <a class="nav-link" href="/login">
        <i class='fas fa-list' style="color: white"></i>
        <span>Login</span></a>
    </li>
    <li class="nav-item active">
      <a class="nav-link" href="/logout">
        <i class='fas fa-list' style="color: white"></i>
        <span>Logout</span></a>
    </li>

    <center><i style = "color: white">--- Admin Pages ---</i></center>
    <li class="nav-item active">
      <a class="nav-link" href="/admin/add">
        <i class='fas fa-list' style="color: white"></i>
        <span>Add Employee</span></a>
    </li>
    <center><i style = "color: white">--- Dispatch Pages ---</i></center>
    <li class="nav-item active">
      <a class="nav-link" href="/dispatch/add">
        <i class='fas fa-list' style="color: white"></i>
        <span>Add Order</span></a>
      <center><i style = "color: white">--- Driver Pages ---</i></center>
    <li class="nav-item active">
      <a class="nav-link" href="/driver/list/active">
        <i class='fas fa-list' style="color: white"></i>
        <span>Show Orders</span></a>

    <%--        <!-- Sidebar Toggler (Sidebar) -->--%>
    <%--        <div class="text-center d-none d-md-inline">--%>
    <%--            <button class="rounded-circle border-0" id="sidebarToggle"></button>--%>
    <%--        </div>--%>

  </ul>
  <!-- End of Sidebar -->

  <!-- Content Wrapper -->
  <div id="content-wrapper" class="d-flex flex-column">

    <!-- Main Content -->
    <div id="content">

      <!-- Topbar -->
      <nav class="navbar navbar-expand navbar-light bg-white topbar mb-4 static-top shadow">

      </nav>
