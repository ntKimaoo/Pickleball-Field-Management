<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page session="true" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Tìm Trận</title>
    <style>
        /* CSS styling */
        .opponent-search {
            width: 400px;
            margin: 50px auto;
            padding: 20px;
            border: 2px solid #4CAF50;
            border-radius: 10px;
            background-color: #f9f9f9;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            text-align: center;
            font-family: Arial, sans-serif;
        }
        .opponent-search h1 {
            color: #4CAF50;
            margin-bottom: 20px;
        }
        .opponent-search button {
            padding: 10px 20px;
            background-color: #4CAF50;
            color: white;
            border: none;
            border-radius: 5px;
            font-size: 16px;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }
        .opponent-search button:hover {
            background-color: #45a049;
        }
        #loading {
            display: none;
            color: #888;
        }
    </style>
    <script>
        function findMatch() {
            document.getElementById("loading").style.display = "block";
            document.getElementById("findMatchBtn").style.display = "none";

            // Gửi yêu cầu tìm đối thủ đến servlet sau mỗi 2 giây
            const intervalId = setInterval(() => {
                fetch('FindOpponentServlet', { method: 'POST' })
                    .then(response => response.json())
                    .then(data => {
                        if (data.player2) {
                            clearInterval(intervalId);
                            document.getElementById("player2").innerText = data.player2;
                            document.getElementById("loading").style.display = "none";
                            window.alert("Bạn đã tìm được trận!!!");
                            window.location.href="home";
                        }
                    });
            }, 10000);
        }
    </script>
</head>
<body>
    <div class="opponent-search">
        <h1>Tìm Đối Thủ</h1>
        <p>Người chơi 1: <span id="player1">${sessionScope.user.username}</span></p>
        <p>Người chơi 2: <span id="player2">Đang chờ...</span></p>
        <button id="findMatchBtn" onclick="findMatch()">Tìm</button>
        <div id="loading">Đang tìm đối thủ...</div>
    </div>
</body>
</html>
