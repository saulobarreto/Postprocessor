function postprocessing( sample, treshold = 0.8)
  
  close all;
  
  num_elements = 200;
  xaxis= 1:num_elements;
  
  input = rand(1,num_elements);
  treshold_vector = ones(1,num_elements).*treshold;
  ouput = zeros(1,num_elements);
  
  DEBOUNCE_COUNTER = 5;
  activation_result = false;
  
  for ( counter = 1 : num_elements )
    
    if( (input(counter) >= treshold) && ( DEBOUNCE_COUNTER == 5 ) )
    
      activation_result = true;
      
    endif
    
    if ( activation_result == true)
      
      DEBOUNCE_COUNTER = DEBOUNCE_COUNTER - 1;
      
    endif
    
    if( (input(counter) < treshold) && ( DEBOUNCE_COUNTER == -1 ) )
      
      activation_result = false;
      DEBOUNCE_COUNTER = 5;
      
    endif
    
    output(1,counter) = activation_result;
    
  endfor
  
  figure();
  hold on;
  plot(xaxis,input,"marker",".");
  plot(xaxis,treshold_vector);
  plot(xaxis,output);
  grid on;
  legend("Inference score","Treshold","Activation");
  
endfunction