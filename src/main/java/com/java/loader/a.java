/*
 * Decompiled with CFR 0.152.
 */
package com.java.loader;

import java.awt.MouseInfo;
import java.awt.Robot;

public class a {
    private Robot var_java_awt_Robot_a;
    private long var_long_a = 0L;

    public a() throws java.awt.AWTException {
        this.var_java_awt_Robot_a = new Robot();
        // Warm-up to prevent initial twitch
        this.var_java_awt_Robot_a.mouseMove(MouseInfo.getPointerInfo().getLocation().x, MouseInfo.getPointerInfo().getLocation().y);
    }

    static double double_a() {
        return Math.random();
    }

    public long long_a() {
        return this.var_long_a;
    }

    public void void_a() {
        this.var_long_a = System.currentTimeMillis();
        this.var_java_awt_Robot_a.mousePress(1024);
    }

    public void b() {
        this.var_java_awt_Robot_a.mouseRelease(1024);
    }

    public void c() {
        this.var_long_a = System.currentTimeMillis();
        this.var_java_awt_Robot_a.mousePress(4096);
    }

    public void d() {
        this.var_java_awt_Robot_a.mouseRelease(4096);
    }

    public void a(int n2, int n3) {
        int n4 = 0;
        int n5 = 0;
        if (n2 != 0) {
            n4 = (int)((Math.random() * (double)(n2 * 2 + 1)) - (double)n2);
        }
        if (n3 != 0) {
            n5 = (int)((Math.random() * (double)(n3 * 2 + 1)) - (double)n3);
        }
        if (n4 != 0 || n5 != 0) {
            this.var_java_awt_Robot_a.mouseMove(MouseInfo.getPointerInfo().getLocation().x + n4, MouseInfo.getPointerInfo().getLocation().y + n5);
        }
    }
}

