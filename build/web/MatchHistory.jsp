<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Match Details</title>
        <style>
            body {
                margin-top: 70px;
                font-family: Arial, sans-serif;
                background-color: #ffff;
                color: #c9d1d9;
                font-size: 14px;
            }
            .match-summary {
                width: 60%;
                margin: 10px auto;
                background-color: #2b2d42;
                border-radius: 6px;
                padding: 10px;
                margin-bottom: 10px;
            }
            .summary-header {
                display: flex;
                justify-content: space-between;
                align-items: center;
                padding: 5px;
                background-color: #3a3b5a;
                border-radius: 6px;
                font-size: 13px;
            }
            .team-details {
                display: flex;
                justify-content: space-around;
                margin-top: 5px;
                padding: 8px;
            }
            .player {
                flex: 1;
                text-align: center;
                font-size: 13px;
            }
            .player-details {
                display: none;
                padding: 5px;
                background-color: #454763;
                margin-top: 5px;
                border-radius: 6px;
            }
            button {
                background-color: #5865f2;
                color: white;
                border: none;
                border-radius: 4px;
                padding: 4px 8px;
                cursor: pointer;
                font-size: 12px;
            }
            button:hover {
                background-color: #7289da;
            }
            table {
                width: 100%;
                font-size: 12px;
            }
            th, td {
                padding: 4px;
                text-align: center;
            }
        </style>
        <script>
            function toggleDetails(matchId) {
                var details = document.getElementById("playerDetails-" + matchId);
                if (details.style.display === "none" || details.style.display === "") {
                    details.style.display = "block";
                } else {
                    details.style.display = "none";
                }
            }
        </script>
    </head>
    <body>
        <a href="profile">Back to profile</a>
        <div style="display: flex; justify-content: center; color: black">
            <h2>Match <b>History</b></h2>
        </div>
        <c:forEach items="${requestScope.listMatch}" var="m" varStatus="status">   
            <div class="match-summary">
                <div class="summary-header">
                    <h2 style="margin: 0; font-size: 14px;">
                        <c:if test="${m.winner.username == sessionScope.user.username}">
                            <p>WIN</p>
                        </c:if>
                        <c:if test="${m.winner.username != sessionScope.user.username}">
                            <p>LOSE</p>
                        </c:if>
                    </h2>
                    <button onclick="toggleDetails('${status.index}')">Chi Tiết Trận Đấu</button>
                </div>
                <div class="team-details">
                    <div class="player">
                        <p><strong>${m.player1.username}</strong> - ${m.player1.rank.rank_name}</p>
                    </div>
                    <div class="player">
                        <p><strong>${m.player2.username}</strong> - ${m.player2.rank.rank_name}</p>
                    </div>
                </div>
                <div id="playerDetails-${status.index}" class="player-details">
                    <table>
                        <tr>
                            <th>Player</th>
                            <th>Score</th>
                            <th>Point</th>
                        </tr>
                        <tr>
                            <td>${m.player1.username}</td>
                            <td>
                                <c:if test="${m.winner.id == m.player1.id}">
                                    <p>${m.resultwin}</p>
                                </c:if>
                                <c:if test="${m.winner.id != m.player1.id}">
                                    <p>${m.resultlose}</p>
                                </c:if>
                            </td>
                            <td>
                                <c:if test="${m.winner.id == m.player1.id}">
                                    <p>+${m.betpoint}</p>
                                </c:if>
                                <c:if test="${m.winner.id != m.player1.id}">
                                    <p>-${m.betpoint}</p>
                                </c:if>
                            </td>
                        </tr>
                        <tr>
                            <td>${m.player2.username}</td>
                            <td>
                                <c:if test="${m.winner.id == m.player2.id}">
                                    <p>${m.resultwin}</p>
                                </c:if>
                                <c:if test="${m.winner.id != m.player2.id}">
                                    <p>${m.resultlose}</p>
                                </c:if>
                            </td>
                            <td>
                                <c:if test="${m.winner.id == m.player2.id}">
                                    <p>+${m.betpoint}</p>
                                </c:if>
                                <c:if test="${m.winner.id != m.player2.id}">
                                    <p>-${m.betpoint}</p>
                                </c:if>
                            </td>
                        </tr>
                    </table>
                </div>
            </div>
        </c:forEach>
    </body>
</html>
