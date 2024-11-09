<!DOCTYPE html>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Friends List</title>
        <link rel="stylesheet" href="styles.css">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    </head>
    <style>
        /* Reset default browser styles */
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: Arial, sans-serif;
            background-image: url('images/addfriend.webp'); /* Background image */
            background-size: cover;
            background-position: center;
            background-repeat: no-repeat;
            backdrop-filter: blur(1px); /* Apply blur effect */
            margin: 0;
            padding: 0;
            height: 100vh; /* Full viewport height */
            display: flex;
            justify-content: center;
            align-items: center;
        }

        .friend-list {
            width: 100%; /* Full width */
            max-width: 400px; /* Limiting max width */
            background-color: lightgray; /* Semi-transparent white background */
            padding: 20px;
            border-radius: 10px;
            height: 100%; /* Full height of the page */
            overflow-y: auto; /* Scroll if content exceeds page */
            color: black; /* Text color inside the friend list set to black */
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2); /* Add shadow for a better visual effect */
        }

        .profile {
            display: flex;
            align-items: center;
            padding-bottom: 20px;
            border-bottom: 1px solid #ccc; /* Light gray for separation */
        }

        .profile-avatar {
            width: 50px;
            height: 50px;
            border-radius: 50%;
            margin-right: 10px;
        }

        .profile-info h2 {
            margin: 0;
            font-size: 18px;
        }

        .status {
            font-size: 12px;
            color: #a9a9a9;
        }

        .online {
            color: #00b300; /* Slightly darker green for online status */
        }

        .offline {
            color: #ff4d4d; /* Slightly softer red for offline status */
        }

        .search {
            margin: 20px 0;
        }

        .search-bar {
            width: 100%;
            padding: 8px;
            border-radius: 5px;
            border: 1px solid #ccc; /* Light gray border for search bar */
            background-color: #f9f9f9; /* Light gray background */
            color: black; /* Black text inside the search bar */
        }

        .friends h3 {
            margin-top: 20px;
            margin-bottom: 10px;
            color: black; /* Black for headings */
        }

        .friends ul {
            list-style-type: none;
            padding: 0;
        }

        .friends li {
            display: flex;
            align-items: center;
            justify-content: space-between; /* Space between friend name and status */
            margin-bottom: 10px;
        }

        .friend-avatar {
            width: 40px;
            height: 40px;
            border-radius: 50%;
            margin-right: 10px;
        }

        .friend-details {
            display: flex;
            flex-grow: 1;
            align-items: center;
        }

        .friends li span {
            display: inline-block;
        }

        .friend-status {
            display: flex;
            justify-content: flex-end;
            width: 100px; /* Adjust width as needed for alignment */
            text-align: right;
        }

    </style>
    <body>
        <div class="friend-list">
            <!-- Profile Section -->

            <div class="row">
                <div class="col">
                    <nav aria-label="breadcrumb" class="bg-body-tertiary rounded-3 p-3 mb-4">
                        <ol class="breadcrumb mb-0">
                            <li class="breadcrumb-item"><a href="home.jsp">Home</a></li>
                            <li class="breadcrumb-item active" aria-current="page"><a href="profile">User Profile</a></li>
                            <li class="breadcrumb-item active" aria-current="page">Friend List</li>
                        </ol>
                    </nav>
                </div>
            </div>  
            <div class="profile">
                <div class="profile-info">
                    <h2>${sessionScope.user.getUsername()}</h2>
                    <span class="status online">Online</span>
                </div>
            </div>

            <!-- Search Bar -->
            <form action="searchfriend" method="get">
                <div class="search">
                    <input type="text" placeholder="Search User" class="search-bar" id="usernameInput" name="key">
                    <input type="submit" hidden="">
                </div>
            </form>
            <c:if test="${found!=null}">
                <table>
                    <thead>
                        <tr>
                            <th></th>
                            <th></th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="s" items="${found}">
                            <tr>
                                <td style="width:300px"><a href="friendprofile?id=${s.getId()}">${s.getNickName()}</a></td>
                                <td><a style="text-decoration: none" href="sendrequest?from=${sessionScope.user.getUsername()}&to=${s.getId()}" style="">Add</a></td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </c:if>

            <!-- Friends List -->
            <div class="friends">
                <h2>Online Friends</h2>
                <c:if test="${onlinefriend!=null}">
                    <ul>
                        <c:forEach var="s" items="${onlinefriend}">
                            <li>
                                <span style="width:200px"><a href="friendprofile?id=${s.getId()}">${s.getNickName()}</a></span>
                                <span class="status online">Online</span>
                                <span style="margin-left: 50px"><a style="text-decoration: none;color:red" href="unfriend?from=${sessionScope.user.getUsername()}&to=${s.getId()}" style="">Unfriend</a></span>
                            </li>
                        </c:forEach>
                    </ul>
                </c:if>
                <h2>Offline Friends</h2>
                <c:if test="${offlinefriend!=null}">
                    <ul>
                        <c:forEach var="s" items="${offlinefriend}">
                            <li>
                                <span style="width:200px"><a href="friendprofile?id=${s.getId()}">${s.getNickName()}</a></span>
                                <span class="status ffline">Offline</span>
                                <span style="margin-left: 50px"><a style="text-decoration: none;color:red" href="unfriend?from=${sessionScope.user.getUsername()}&to=${s.getId()}" style="">Unfriend</a></span>
                            </li>
                        </c:forEach>
                    </ul>
                </c:if>
                <h2>Invite</h2>
                <c:if test="${requestlist!=null}">
                    <table>
                        <thead>
                            <tr>
                                <th></th>
                                <th></th>
                                <th></th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach var="s" items="${requestlist}">
                                <tr>
                                    <td style="width:200px"><a href="friendprofile?id=${s.getId()}">${s.getNickName()}</a></td>
                                    <td><a style="text-decoration: none;color:green" href="accept?from=${sessionScope.user.getUsername()}&to=${s.getId()}" style="">Accept</a></td>
                                    <td><a style="text-decoration: none;color:red;margin-left: 50px" href="refuse?from=${sessionScope.user.getUsername()}&to=${s.getId()}" style="">Refuse</a></td>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                </c:if>
            </div>
        </div>
    </body>

</html>
