package com.demo.domain;

public class Menu {
    private int id;
    private String name;
    private int parent;
    private String url;

    public Menu() {
    }

    public Menu(int id, String name, int parent, String url) {
        this.id = id;
        this.name = name;
        this.parent = parent;
        this.url = url;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public int getParent() {
        return parent;
    }

    public void setParent(int parent) {
        this.parent = parent;
    }

    public String getUrl() {
        return url;
    }

    public void setUrl(String url) {
        this.url = url;
    }

    @Override
    public String toString() {
        return "Menu{" +
                "id=" + id +
                ", name='" + name + '\'' +
                ", parent=" + parent +
                ", url='" + url + '\'' +
                '}';
    }
}
