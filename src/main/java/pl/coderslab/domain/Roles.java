package pl.coderslab.domain;

public enum Roles {
    USER("User"),ADMIN("Admin"),DISPATCH("Dispatch");
    private final String roleName;

    Roles(String roleName) {
        this.roleName = roleName;
    }

    public String getRoleName() {
        return roleName;
    }
}
