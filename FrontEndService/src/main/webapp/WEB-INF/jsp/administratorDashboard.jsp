<%@page import="java.util.Map"%>
<%@page import="com.example.FrontEndService.model.DepartmentListModel"%>
<%@page import="java.util.List"%>
<%@page import="com.example.FrontEndService.model.ContactUsModel"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>Administrator Dashboard</title>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/tailwindcss/1.7.3/tailwind.min.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/tailwindcss/1.4.6/tailwind.min.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.13.0/css/all.min.css">

<style>
.dropdown {
	display: flex;
	align-items: center;
	justify-content: center;
}

.dropdown-content {
	display: none;
	position: absolute;
	background-color: #f9f9f9;
	min-width: 160px;
	box-shadow: 0px 8px 16px 0px rgba(0, 0, 0, 0.2);
	z-index: 1;
	top: 10%;
}

.dropdown-content a {
	float: none;
	color: black;
	padding: 12px 16px;
	text-decoration: none;
	display: block;
	text-align: left;
}

.dropdown-content a:hover {
	background-color: #ddd;
}

@media screen and (max-width: 770px) {
	.dropdown {
		justify-content: flex-start;
	}
	.dropdown-content {
		top: 24%;
	}
}

.header-2 {
	flex: 1;
}

.footer-1 {
	background-color: #f9f9f9;
	padding: 2rem 0;
}

@media screen and (max-width: 480px) {
	.footer2 {
		font-size: 14px;
	}
}

.footer2 {
	border-top: 1px solid gainsboro;
	padding-top: 1rem;
	text-align: center;
}

.footer-links {a { padding-bottom:2px;
	
}
}
</style>
</head>
<body class="font-sans bg-gray-100">

	<nav class="bg-white py-2 md:py-4">
		<div class="container px-4 mx-auto md:flex md:items-center">

			<div class="flex justify-between items-center">
				<a href="#" class="font-bold text-xl text-indigo-600">EMS</a>
				<button
					class="border border-solid border-gray-600 px-3 py-1 rounded text-gray-600 opacity-50 hover:opacity-75 md:hidden"
					id="navbar-toggle">
					<i class="fas fa-bars"></i>
				</button>
			</div>

			<div
				class="hidden md:flex flex-col md:flex-row md:ml-auto mt-3 md:mt-0"
				id="navbar-collapse">
				<a href="/index"
					class="p-2 lg:px-4 md:mx-2 text-gray-600 rounded hover:bg-gray-200 hover:text-gray-700 transition-colors duration-300">Home</a>
				<%-- <a href="#" class="p-2 lg:px-4 md:mx-2 text-gray-600 rounded hover:bg-gray-200 hover:text-gray-700 transition-colors duration-300">Services</a> --%>
				<div class="dropdown">
					<a href="#"
						class="p-2 lg:px-4 md:mx-2 text-white rounded bg-indigo-600"
						onclick="toggleDropdown('servicesDropdown')">Services</a>
					<div id="servicesDropdown" class="dropdown-content">
						<a href="/createEmployee">Create</a> <a href="/updateEmployee">Update</a>
						<a href="/deleteEmployee">Delete</a> <a href="/readAllEmployee">Display</a>
						<a href="/admin/dashboard">Dashboard</a>
					</div>
				</div>

				<a href="/aboutus"
					class="p-2 lg:px-4 md:mx-2 text-gray-600 rounded hover:bg-gray-200 hover:text-gray-700 transition-colors duration-300">About</a>
				<a href="/contactus"
					class="p-2 lg:px-4 md:mx-2 text-gray-600 rounded hover:bg-gray-200 hover:text-gray-700 transition-colors duration-300">Contact</a>
				<a href="/login"
					class="p-2 lg:px-4 md:mx-2 text-indigo-600 text-center border border-solid border-indigo-600 rounded hover:bg-indigo-600 hover:text-white transition-colors duration-300 mt-1 md:mt-0 md:ml-1">Admin/Emp
					Login</a> <a href="/auth/logout"
					class="p-2 lg:px-4 md:mx-2 text-indigo-600 text-center border border-solid border-indigo-600 rounded hover:bg-indigo-600 hover:text-white transition-colors duration-300 mt-1 md:mt-0 md:ml-1">Logout</a>
			</div>
		</div>
	</nav>





	<div class="max-w-screen-md mx-auto p-5" style="border: solid;">
		<h1
			class="bg-indigo-600 text-white py-2 px-6 rounded-full text-xl mt-6 "
			style="width: 40%; margin-left: 33%;">Administrator Dashboard</h1>

		<!-- Employee Service Section -->
		<h2 class="text-xl mb-2" style="font-weight: bold;">Employee
			Service</h2>
		<ol class="list-decimal ml-6 mb-4">
			<li><a href="/createEmployee" class="text-blue-500">Create
					New Employee</a></li>
			<li><a href="/readAllEmployee" class="text-blue-500">Read
					All Employee</a></li>
			<li><a href="/updateEmployee" class="text-blue-500">Update
					An Employee</a></li>
			<li><a href="/deleteEmployee" class="text-blue-500">Delete
					An Employee</a></li>
		</ol>

		<!-- Departments Section -->
		<h2 class="text-xl mb-2">Departments</h2>
		<h3 class="text-lg">Department List</h3>

		<%-- Add Department Message --%>
		<%
		Map<String, String> addDeparmentNameResponce = (Map<String, String>) request.getAttribute("addDeparmentNameResponce");
		%>
		<%
		if (addDeparmentNameResponce != null && addDeparmentNameResponce.get("status").equals("fail")) {
		%>
		<p style="color: red"><%=addDeparmentNameResponce.get("message")%>
		</p>
		<%
		} else if (addDeparmentNameResponce != null && addDeparmentNameResponce.get("status").equals("success")) {
		%>
		<p style="color: green"><%=addDeparmentNameResponce.get("message")%>
		</p>
		<%
		}
		%>

		<!-- Add Department Form -->
		<form action="createDepartment" method="post" class="mb-4">
			<p class="mb-2">Make New Department:</p>
			<input type="text" name="departmentName"
				class="border rounded py-2 px-3"> <input type="submit"
				value="Add Department"
				class="bg-blue-500 text-white py-2 px-4 rounded">
		</form>

		<!-- Department List Table -->
		<%
		List<DepartmentListModel> departmentList = (List<DepartmentListModel>) request.getAttribute("departmentListModel");
		%>
		<table class="table-auto mb-6">
			<thead>
				<tr>
					<th class="border px-4 py-2">Department Name</th>
				</tr>
			</thead>
			<tbody>
				<%
				for (DepartmentListModel department : departmentList) {
				%>
				<tr>
					<td class="border px-4 py-2"><%=department.getName()%></td>
				</tr>
				<%
				}
				%>
			</tbody>
		</table>

		<hr class="my-6">

		<!-- Unanswered Queries Section -->
		<h2 class="text-xl mb-2" style="font-weight: bold;">Unanswered
			Queries</h2>

		<%
		List<ContactUsModel> contactUsModelList = (List<ContactUsModel>) request.getAttribute("contactUsModelList");
		%>
		<%
		if (contactUsModelList.size() != 0) {
		%>
		<table class="table-auto mb-6">
			<thead>
				<tr>
					<th class="border px-4 py-2">Name</th>
					<th class="border px-4 py-2">Email</th>
					<th class="border px-4 py-2">Query</th>
					<th class="border px-4 py-2">Status</th>
				</tr>
			</thead>
			<tbody>
				<%
				for (ContactUsModel contactUs : contactUsModelList) {
					String name = contactUs.getName();
					String email = contactUs.getEmail();
					String query = contactUs.getQuery();
					String status = contactUs.isSolved() ? "Resolved" : "Not Resolved";
				%>
				<tr>
					<td class="border px-4 py-2"><%=name%></td>
					<td class="border px-4 py-2"><%=email%></td>
					<td class="border px-4 py-2"><%=query%></td>
					<td class="border px-4 py-2"><%=status%></td>
				</tr>
				<%
				}
				%>
			</tbody>
		</table>
		<%
		} else {
		%>
		<p>All queries are solved.</p>
		<%
		}
		%>
	</div>

	<footer class="footer-1 bg-gray-100 py-8 sm:py-12"
		style="line-height: 3vh;">
		<div class="container mx-auto px-4">
			<div class="sm:flex sm:flex-wrap sm:-mx-4 md:py-4">
				<div class="px-4 sm:w-1/2 md:w-1/4 xl:w-1/6">
					<h5 class="text-xl font-bold mb-6">Features</h5>
						<ul class="list-none footer-links">
							<li class="mb-2"><a href="/createEmployee"
								class="border-b border-solid border-transparent hover:border-purple-800 hover:text-purple-800">Create
									Service</a></li>
							<li class="mb-2"><a href="/readAllEmployee"
								class="border-b border-solid border-transparent hover:border-purple-800 hover:text-purple-800">Read
									Service</a></li>
							<li class="mb-2"><a href="/updateEmployee"
								class="border-b border-solid border-transparent hover:border-purple-800 hover:text-purple-800">Update
									Service</a></li>
							<li class="mb-2"><a href="/deleteEmployee"
								class="border-b border-solid border-transparent hover:border-purple-800 hover:text-purple-800">Delete
									Service</a></li>
						</ul>
					</div>
					<div class="px-4 sm:w-1/2 md:w-1/4 xl:w-1/6 mt-8 sm:mt-0">
						<h5 class="text-xl font-bold mb-6">Resources</h5>
						<ul class="list-none footer-links">
							<li class="mb-2"><a href="/admin/dashboard"
								class="border-b border-solid border-transparent hover:border-purple-800 hover:text-purple-800">Dashboard</a>
							</li>
							<li class="mb-2"><a href="/login"
								class="border-b border-solid border-transparent hover:border-purple-800 hover:text-purple-800">Login Page
									</a></li>
							<li class="mb-2"><a href="/auth/logout"
								class="border-b border-solid border-transparent hover:border-purple-800 hover:text-purple-800">Logout Page
									</a></li>
						</ul>
					</div>
					<div class="px-4 sm:w-1/2 md:w-1/4 xl:w-1/6 mt-8 md:mt-0">
						<h5 class="text-xl font-bold mb-6">About</h5>
						<ul class="list-none footer-links">
							<li class="mb-2"><a href="/index"
								class="border-b border-solid border-transparent hover:border-purple-800 hover:text-purple-800">Home Page</a>
							</li>
							<li class="mb-2"><a href="/aboutus"
								class="border-b border-solid border-transparent hover:border-purple-800 hover:text-purple-800">About Us</a>
							</li>
						</ul>
					</div>
					<div class="px-4 sm:w-1/2 md:w-1/4 xl:w-1/6 mt-8 md:mt-0">
						<h5 class="text-xl font-bold mb-6">Help</h5>
						<ul class="list-none footer-links">
							<li class="mb-2"><a href="/contactus"
								class="border-b border-solid border-transparent hover:border-purple-800 hover:text-purple-800">Contact Us</a>
							</li>
						</ul>
				</div>
				<div
					class="px-4 mt-4 sm:w-1/3 xl:w-1/6 sm:mx-auto xl:mt-0 xl:ml-auto">
					<h5 class="text-xl font-bold mb-6 sm:text-center xl:text-left">Stay
						connected</h5>
					<div class="flex sm:justify-center xl:justify-start">
						<a href=""
							class="w-8 h-8 border border-2 border-gray-400 rounded-full text-center py-1 text-gray-600 hover:text-white hover:bg-blue-600 hover:border-blue-600">
							<i class="fab fa-facebook"></i>
						</a> <a href=""
							class="w-8 h-8 border border-2 border-gray-400 rounded-full text-center py-1 ml-2 text-gray-600 hover:text-white hover:bg-blue-400 hover:border-blue-400">
							<i class="fab fa-twitter"></i>
						</a> <a href=""
							class="w-8 h-8 border border-2 border-gray-400 rounded-full text-center py-1 ml-2 text-gray-600 hover:text-white hover:bg-red-600 hover:border-red-600">
							<i class="fab fa-google-plus-g"></i>
						</a>
					</div>
				</div>
			</div>
			<div class="footer2">Copyright © 2024 Yash . All Right
				Reserved .</div>

		</div>
	</footer>

	<script>
	let toggleBtn = document.querySelector("#navbar-toggle");
	let collapse = document.querySelector("#navbar-collapse");

	toggleBtn.onclick = () => {
	  collapse.classList.toggle("hidden");
	  collapse.classList.toggle("flex");
	};



	        function toggleDropdown(dropdownId) {
	            var dropdown = document.getElementById(dropdownId);
	            if (dropdown.style.display === "block") {
	                dropdown.style.display = "none";
	            } else {
	                dropdown.style.display = "block";
	            }
	        }


	</script>
</body>
</html>
