package com.administrator;

public class AdminFail {

    public String msg;

    public void fail(String res) {

        switch (res) {
            case "addadminfail":
                msg = "Admin Registration Failed.";
                break;
            case "addcatalogfail":
                msg = "New Catalog Entry Failed.";
                break;
            case "addproductfail":
                msg = "New Product Entry Failed.";
                break;
            case "addproductquantityfail":
                msg = "Add Product Quantity Failed.";
                break;
            case "editpricefail":
                msg = "Editing of Product Price Failed.";
                break;
            case "removeadminfail":
                msg = "Removing Admin Failed.";
                break;
            case "removecatalogfail":
                msg = "Removing Catalog Failed.";
                break;
            case "removeproductfail":
                msg = "Removing Product Failed.";
                break;
        }
    }
}
