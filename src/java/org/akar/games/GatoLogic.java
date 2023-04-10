
package org.akar.games;

public class GatoLogic {
    
    //X=1
    //0=5
    private Integer[][] gatoMatriz;
    
    public GatoLogic(){
        this.gatoMatriz = new Integer[3][3];
        for (int i = 0; i < 3; i++) {
            for (int j = 0; j < 3; j++) {
                gatoMatriz[i][j] = 0;
            }
        }
    }
    
    public void setVal(int y, int x, int val){
        
        gatoMatriz[y][x] = val;
        
    }
    
    public int getVal(int y, int x){
        
        int val = gatoMatriz[y][x];
        return val;
        
    }
    
    public int tresEnRaya(){
        
        int sum = 0;
        int y = 2;
        int x = 0;
        
        for (int i = 0; i < 3; i++) {
            for (int j = 0; j < 3; j++) {
                sum = sum+gatoMatriz[i][j];
                if (sum == 3 || sum == 15) {
                    return sum;
                }
            }
            sum = 0;
        }
        
        for (int i = 0; i < 3; i++) {
            for (int j = 0; j < 3; j++) {
                sum = sum+gatoMatriz[j][i];
                if (sum == 3 || sum == 15) {
                    return sum;
                }
            }
            sum = 0;
        }
        
        for (int i = 0; i < 3; i++) {
            sum = sum+gatoMatriz[i][i];
        }
        
        if(sum == 3 || sum == 15){
            return sum;
        }else{
            sum = 0;
            while(y >= 0){
                sum = sum+gatoMatriz[y][x];
                y = y-1;
                x++;
            }
            if(sum == 3 || sum == 15){
                return sum;
            }
            else{
                return 0;
            }
        }
        
    } 
    
}
