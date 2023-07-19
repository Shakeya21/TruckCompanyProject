package pl.coderslab.zdatabase;


import org.springframework.format.annotation.DateTimeFormat;

import javax.persistence.*;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.Pattern;
import java.time.LocalDateTime;
import java.util.Date;

@Entity
public class TransportOrder {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    @Pattern(regexp = "[A-Z]{3}\\d{4}|[A-Z]\\d{6}")
    private String trailerNum;
    @NotBlank
    private String destCity;
    @NotBlank
    private String destState;
    private String status;
    @Temporal(TemporalType.DATE)
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private Date date;
    @ManyToOne
    private Contractors contractors;
    @ManyToOne
    private Employees employees;

    @ManyToOne
    private Packages packages;

    public Packages getPackages() {
        return packages;
    }

    public void setPackages(Packages packages) {
        this.packages = packages;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getTrailerNum() {
        return trailerNum;
    }

    public void setTrailerNum(String trailerNum) {
        this.trailerNum = trailerNum;
    }

    public String getDestCity() {
        return destCity;
    }

    public void setDestCity(String destCity) {
        this.destCity = destCity;
    }

    public String getDestState() {
        return destState;
    }

    public void setDestState(String destState) {
        this.destState = destState;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public Contractors getContractors() {
        return contractors;
    }

    public void setContractors(Contractors contractors) {
        this.contractors = contractors;
    }

    public Employees getEmployees() {
        return employees;
    }

    public void setEmployees(Employees employees) {
        this.employees = employees;
    }

    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }
}
