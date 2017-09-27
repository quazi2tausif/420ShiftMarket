package com.product;

public class ShowCase {

    public String pro_img, pro_name, pro_cost, pro_cata, img_res;
    public int pro_total;

    public void smart_phone(String pro_id) {

        switch (pro_id) {
            case "101":
                pro_cata = "Pro_101";
                pro_img = "img/smart_phone/iphone.jpeg";
                pro_name = "Appel Iphone 7";
                pro_cost = "Rs. 57,000";
                img_res = "style='width: 32px; height: 69px;'";
                pro_total = 57000;
                break;
            case "102":
                pro_cata = "Pro_101";
                pro_img = "img/smart_phone/pixel.jpeg";
                pro_name = "Google Pixel XL M7";
                pro_cost = "Rs. 57,000";
                img_res = "style='width: 32px; height: 69px;'";
                pro_total = 57000;
                break;
            case "103":
                pro_cata = "Pro_101";
                pro_img = "img/smart_phone/lumia920.jpeg";
                pro_name = "Nokia Lumia 920";
                pro_cost = "Rs. 29,447";
                img_res = "style='width: 32px; height: 69px;'";
                pro_total = 29447;
                break;
            case "104":
                pro_cata = "Pro_101";
                pro_img = "img/smart_phone/motoz.jpeg";
                pro_name = "Motorola Moto Z XT1650";
                pro_cost = "Rs. 39,999";
                img_res = "style='width: 32px; height: 69px;'";
                pro_total = 39999;
                break;
        }
    }

    public void laptop(String pro_id) {

        switch (pro_id) {
            case "201":
                pro_cata = "Pro_201";
                pro_img = "img/laptop/macbook.jpeg";
                pro_name = "Apple MacBook Air Core i5 5th Gen";
                pro_cost = "Rs. 55,995";
                img_res = "style='width: 69px; height: 32px;'";
                pro_total = 55995;
                break;
            case "202":
                pro_cata = "Pro_201";
                pro_img = "img/laptop/imprint.jpeg";
                pro_name = "HP Core i7 6th Gen";
                pro_cost = "Rs. 56,990";
                img_res = "style='width: 69px; height: 32px;'";
                pro_total = 56990;
                break;
            case "203":
                pro_cata = "Pro_201";
                pro_img = "img/laptop/ideapad.jpeg";
                pro_name = "HP APU Quad Core A8 6th Gen";
                pro_cost = "Rs. 25,990";
                img_res = "style='width: 69px; height: 32px;'";
                pro_total = 25990;
                break;
            case "204":
                pro_cata = "Pro_201";
                pro_img = "img/laptop/notebook.jpeg";
                pro_name = "Lenovo 310 Core i5 6th Gen";
                pro_cost = "Rs. 41,990";
                img_res = "style='width: 69px; height: 32px;'";
                pro_total = 41990;
                break;
        }
    }

    public void smart_tv(String pro_id) {

        switch (pro_id) {
            case "301":
                pro_cata = "Pro_301";
                pro_img = "img/smart_tv/sansui.jpeg";
                pro_name = "Sansui 122cm (48) Full HD LED TV";
                pro_cost = "Rs. 39,999";
                img_res = "style='width: 69px; height: 32px;'";
                pro_total = 39999;
                break;
            case "302":
                pro_cata = "Pro_301";
                pro_img = "img/smart_tv/sony.jpeg";
                pro_name = "Sony Bravia 123.2cm (49) Full HD Smart LED TV";
                pro_cost = "Rs. 76,999";
                img_res = "style='width: 69px; height: 32px;'";
                pro_total = 76999;
                break;
            case "303":
                pro_cata = "Pro_301";
                pro_img = "img/smart_tv/videocon.jpeg";
                pro_name = "Videocon 124cm (50) Full HD LED TV";
                pro_cost = "Rs. 38,490";
                img_res = "style='width: 69px; height: 32px;'";
                pro_total = 38490;
                break;
            case "304":
                pro_cata = "Pro_301";
                pro_img = "img/smart_tv/vu.jpeg";
                pro_name = "Vu 127cm (50) Full HD Smart LED TV";
                pro_cost = "Rs. 41,999";
                img_res = "style='width: 69px; height: 32px;'";
                pro_total = 41999;
                break;
        }
    }
}
