module lightTrafficController(  input logic TA,
                                input logic TB,
                                input logic reset,
                                input logic clk,
                                output logic [2:0] LA,
                                output logic [2:0] LB);

    //use typedef to define what a statetype is
    //declare state and nextState to be of type statetype
    typedef enum logic [2:0] {S0, S1, S2, S3} statetype;
    statetype state, nextState;
    
    //state register logic
    //always_ff and an if else statement
    always_ff @ (posedge clk, posedge reset)
    begin
        if (reset) state <= S0;
        else state <= nextState;
    end
    
    
    //next state logic 
    //always_comb and a case statement
    always_comb
        case(state)
            S0: if( TA ) nextState = S0;
                else nextState = S1;
            S1: nextState = S2;
            
            S2: if( TB ) nextState = S2;
                else nextState = S3;
            S3: nextState = S0;
            default: nextState = S0;
        endcase
        
    //output logic
    assign LA[2] =  (state == S2) | (state == S3);//light A red if state is S2 or S3
    assign LA[1] =  (state == S1); //light A yellow in state S1
    assign LA[0] =  (state == S0); //light A green in state S0
    assign LB[2] =  (state == S0) | (state == S1);//light B  red if state is S0 or S1
    assign LB[1] =  (state == S3);//light B  yellow in S3  
    assign LB[0] =  (state == S2);//light B  green in S2
    
endmodule