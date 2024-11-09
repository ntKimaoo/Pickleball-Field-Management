/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Model;

import dal.CustomerDAO;
import java.util.LinkedList;
import java.util.Map;
import java.util.Queue;
import java.util.concurrent.ConcurrentHashMap;

/**
 *
 * @author pc
 */
public class MatchQueue {
    private static Queue<Integer> waitingUsers = new LinkedList<>();
    private static Map<Integer, Integer> matchedPairs = new ConcurrentHashMap<>();

    public static synchronized void addUser(int userId) {
        if(!waitingUsers.contains(userId) && !matchedPairs.containsKey(userId)){
            waitingUsers.add(userId);
        }
    }

    public static void matchUsers() {
        if (waitingUsers.size() >= 2) {
            int player1 = waitingUsers.poll();
            for(int p: waitingUsers){
                CustomerDAO cd = new CustomerDAO();
                if(Math.abs(cd.getCustomerByIdRank(p).getRank().getRank_id()-cd.getCustomerByIdRank(player1).getRank().getRank_id())<=1){
                    waitingUsers.remove(p);
                    matchedPairs.put(player1, p);
                    matchedPairs.put(p, player1);
                    return;
                }
            }
            waitingUsers.add(player1);
        }
    }

    // Lấy đối thủ của người chơi
    public static Integer getOpponent(int userId) {
        return matchedPairs.get(userId); // Trả về đối thủ nếu đã được ghép cặp
    }
}
