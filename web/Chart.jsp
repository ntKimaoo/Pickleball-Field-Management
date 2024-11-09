<%-- 
    Document   : dashboard
    Created on : Sep 28, 2024, 9:56:26 PM
    Author     : kiennn
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <!-- Boxicons -->
        <link href='https://unpkg.com/boxicons@2.0.9/css/boxicons.min.css' rel='stylesheet'>
        <!-- My CSS -->
        <link rel="stylesheet" href="css/style_dashboard.css">
        <script src="https://www.gstatic.com/charts/loader.js"></script>
        <script>
            google.charts.load('current', {packages: ['corechart', 'bar']});
            google.charts.setOnLoadCallback(drawBasic);

            function drawBasic() {

                var data = new google.visualization.DataTable();
                data.addColumn('string', 'Day of the Week');
                data.addColumn('number', 'Số sân đã đặt');

                data.addRows([
            <c:forEach var="entry" items="${countBase}" varStatus="status">
                ['${entry.key}', ${entry.value}]<c:if test="${!status.last}">,</c:if>
            </c:forEach>
                ]);

                var options = {
                    title: 'Thống kê theo ${ngayThangHienTai}',
                    width: 600,
                    height: 400,
                    hAxis: {
                        title: 'Số lượng sân đã đặt theo ngày trong tuần',
                        format: 'h:mm a',
                        viewWindow: {
                            min: [7, 30, 0],
                            max: [17, 30, 0]
                        }
                    },
                    vAxis: {
                        title: 'Số lượng'
                    }
                };

                var chart = new google.visualization.ColumnChart(
                        document.getElementById('chart_div'));

                chart.draw(data, options);
            }

        </script>
        <script type="text/javascript">
            google.charts.load("current", {packages: ["corechart"]});
            google.charts.setOnLoadCallback(drawChart);
            function drawChart() {
                var data = google.visualization.arrayToDataTable([
                ['Day', 'Hours'],
            <c:forEach var="entry" items="${hoursPerDay}" varStatus="status">
                ['${entry.key}', {v: ${entry.value}, f: '${entry.value} giờ đã đặt'}]<c:if test="${!status.last}">,</c:if>
            </c:forEach>
                ]);

                var options = {
                    width: 600,
                    height: 400,
                    title: 'Số giờ đã đặt trong tuần',
                    is3D: true,
                };

                var chart = new google.visualization.PieChart(document.getElementById('piechart_3d'));
                chart.draw(data, options);
            }
        </script>
        <script type='text/javascript'>
            google.charts.load('current', {'packages': ['annotationchart']});
            google.charts.setOnLoadCallback(drawChart);

            function drawChart() {
                var data = new google.visualization.DataTable();
                data.addColumn('string', 'Month');
                data.addColumn('number', 'người đăng kí');
                data.addRows([
            <c:forEach var="entry" items="${numberOfUser}" varStatus="status">
                ['Tháng ${entry.key}', ${entry.value}]
                <c:if test="${!status.last}">,</c:if>
            </c:forEach>

                ]);


                var chart = new google.visualization.AnnotationChart(document.getElementById('chart_div2'));

                var options = {
                    width: 600,
                    height: 400,
                    title: 'Số lượng người tham gia vào hệ thống trong 6 tháng gần đây',
                    hAxis: {
                        title: 'Month'
                    },
                    vAxis: {
                        title: 'Number of registers'
                    },
                    annotations: {
                        style: 'line',
                        textStyle: {
                            color: '#ff0000',
                            fontSize: 12
                        },
                        line: {
                            color: '#ff0000',
                            lineWidth: 2,
                            lineDashStyle: [4, 4]
                        }
                    }
                };
                var chart = new google.visualization.LineChart(document.getElementById('chart_div2'));
                chart.draw(data, options);
                var targetLine = [
                    {type: 'line', x: 'March', y: 75, text: 'Target', lineDashStyle: [4, 4]}
                ];
                chart.setAnnotations(targetLine);
            }
        </script>
        <script>
            google.charts.load('current', {packages: ['corechart', 'bar']});
            google.charts.setOnLoadCallback(drawTrendlines);

            function drawTrendlines() {
                var data = new google.visualization.DataTable();
                data.addColumn('string', 'Day of the Week');
                data.addColumn('number', 'Tiền đã nạp');
                data.addColumn('number', 'Membership');

                data.addRows([
                    ['Monday', 4, 3],
                    ['Tuesday', 2, 5],
                    ['Wednesday', 3, 3],
                    ['Thurdays', 7, 5],
                    ['Friday', 1, 7],
                    ['Sunday', 6, 2]
                ]);

                var options = {
                    width: 600,
                    height: 400,
                    title: 'Số lượng sản phẩm bán ra và người mua trong tháng',
                    hAxis: {
                        title: 'Mười ngày gần đây',
                        viewWindow: {
                            min: [7, 30, 0],
                            max: [17, 30, 0]
                        }
                    },
                    vAxis: {
                        title: 'Số lượng'
                    }
                };

                var chart = new google.visualization.ColumnChart(document.getElementById('column_chart'));
                chart.draw(data, options);
            }
        </script>
        <title>Charts</title>
    </head>
    <body>

        <%@include file="sidebardashboard.jsp" %>
        <section id="content">
            <%@include file="headerdashboard.jsp" %>
            <main>
                <div class="head-title">
                    <div class="left">
                        <h1>Dashboard</h1>
                    </div>
                </div>
                <ul class="box-info" style="margin-bottom: 30px">
                    <li>
                        <i class='bx bxs-calendar-check' ></i>
                        <span class="text">
                            <h3>${numberOforder}</h3>
                            <p>New Order</p>
                        </span>
                    </li>
                    <li>
                        <i class='bx bxs-group' ></i>
                        <span class="text">
                            <h3>${numOfCus}</h3>
                            <p>Visitors</p>
                        </span>
                    </li>
                    <li>
                        <i class='bx bxs-dollar-circle' ></i>
                        <span class="text">
                            <h3>$2543</h3>
                            <p>Total Sales</p>
                        </span>
                    </li>
                </ul>
                <table class="columns">
                    <tr>
                        <td><div id="chart_div" style="border: 1px solid #ccc"></div></td>
                        <td><div id="piechart_3d" style="border: 1px solid #ccc"></div></td>
                    </tr>
                </table>
                <table class="columns">
                    <tr>
                        <td><div id="chart_div2" style="border: 1px solid #ccc"></div></td>
                        <td><div id="column_chart" style="border: 1px solid #ccc"></div></td>
                    </tr>
                </table>
            </main>
        </section>
        <!-- CONTENT -->
        <script src="script.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
        <script src='https://kit.fontawesome.com/a076d05399.js' crossorigin='anonymous'></script>
    </body>
</html>
