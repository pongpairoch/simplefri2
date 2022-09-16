package sit.int202.simplefri.models;

import lombok.*;

@Getter
@Setter
@AllArgsConstructor
@ToString
@NoArgsConstructor
@EqualsAndHashCode
public class SimpleCalc {
    private Double x;
    private Double y;
    public double getAdd(){
        return x+y;
    }

    public double getSubstract(){
        return x-y;
    }

    public double getMultiply(){
        return x*y;
    }

    public double getDiv(){
         return x/y;
    }
}
