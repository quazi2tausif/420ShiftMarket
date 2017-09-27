package com.client;

public class ClientPath {

    public String client_url;
    public String proid, proname, proquan;
    public String prid[], prna[], prqu[];

    public void client_login(String cp) {

        switch (cp) {
            case "420market":
                client_url = "420market.jsp";
                break;
            case "cart":
                client_url = "client/client_cart.jsp";
                break;
            case "smartphone":
                client_url = "market/smart_phone.jsp";
                break;
            case "laptop":
                client_url = "market/laptop.jsp";
                break;
            case "smarttv":
                client_url = "market/smart_tv.jsp";
                break;
            case "customersupport":
                client_url = "support/customer_care.jsp";
                break;
            case "aboutus":
                client_url = "market/about_us.jsp";
                break;
            case "yourpurchase":
                client_url = "client/client_purchase.jsp";
                break;
        }
    }

    public void client_login_product_id(String cl, String id) {

        switch (cl) {
            case "productdisplayphone":
                client_url = "market/product_display_phone.jsp?pro_id=" + id;
                break;
            case "productdisplaylaptop":
                client_url = "market/product_display_laptop.jsp?pro_id=" + id;
                break;
            case "productdisplaytv":
                client_url = "market/product_display_tv.jsp?pro_id=" + id;
                break;
        }
    }

    public void product_placement(String pp) {

        switch (pp) {
            case "ADD TO CART":
                client_url = "AddToCart";
                break;
            case "BUY NOW":
                client_url = "BuyNow";
                break;
        }
    }

    public void add_to_cart_fail(String pr) {
        switch (pr) {
            case "sp":
                client_url = "client/product_display_phone.jsp?msg=fail";
                break;
            case "l":
                client_url = "client/product_display_laptop.jsp?msg=fail";
                break;
            case "st":
                client_url = "client/product_display_tv.jsp?msg=fail";
                break;
        }
    }

    public void client_address_atc(String atc, String pi, String pn, String q) {

        if (atc != null) {
            String pi1 = pi.replace("[", "");
            String pi2 = pi1.replace("]", "");
            proid = pi2.replace(",", "<br>");
            String pn1 = pn.replace("[", "");
            String pn2 = pn1.replace("]", "");
            proname = pn2.replace(",", "<br>");
            String q1 = q.replace("[", "");
            String q2 = q1.replace("]", "");
            proquan = q2.replace(",", "<br>");
        } else {
            proid = pi;
            proname = pn;
            proquan = q;
        }
    }

    public void payment_mode(String atc, String pi, String pn, String q) {

        if (atc != null) {
            String pi1 = pi.replace("[", "");
            String pi2 = pi1.replace("]", "");
            String pi3 = pi2.replace(" ", "");
            prid = pi3.split(",");
            String pn1 = pn.replace("[", "");
            String pn2 = pn1.replace("]", "");
            String pn3 = pn2.replace(" ", "");
            prna = pn3.split(",");
            String q1 = q.replace("[", "");
            String q2 = q1.replace("]", "");
            String q3 = q2.replace(" ", "");
            prqu = q3.split(",");
        } else {
            prid = pi.split(",");
            prna = pn.split(",");
            prqu = q.split(",");
        }
    }
}
