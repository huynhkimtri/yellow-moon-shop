/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package trihk.moonshop.helper;

import java.util.Random;
import java.util.UUID;

/**
 *
 * @author TriHuynh
 */
public class Test {

    public static void main(String[] args) {
        UUID uuid = UUID.randomUUID();
        System.out.println(uuid.toString().length());
    }
}
