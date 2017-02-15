#encoding: ASCII-8BIT

class Cifrador
        #mete cadena de simbolos
        def pasarBinario(cadena)
            binario = ""
            cadena.bytes do |c|
                # 32 es el espacio Se pone un 0 para que se de 8 bit
                if( c != 32) then
                    binario << "0" + c.to_s(2)
                else
                     binario << "00" + c.to_s(2)
                end 
            end
           
            return binario
        end
        
        def generarClave(tam)
            cad = ""
            tam.to_i.times do
                cad << (1..8).map { [0, 1].sample }.join
            end
            cad
        end
        
        
        
        def cifradoxor(mensaje,claveB,nveces)
            puts "\n\n"
            puts "CIFRANDO MENSAJE"
            puts "----------------"
            puts "\n"
            #Si el tamaño de la clave y del mensaje son iguales se puede hacer
            
            mensajeB = pasarBinario(mensaje)
            
            if (mensajeB.length == claveB.length) then
                
            
                #xor se le pasara dos cadnas binarias devuelve Binario.
                resul = xor(mensajeB,claveB)
                
                nveces.to_i.times do
                    resul = xor(resul,claveB)
                end
                
                
            
                puts "Mensaje Original es: " + mensaje
                puts "Mensaje Original en binario: " + mensajeB
                puts "Longitud del mensaje en binario: " + mensajeB.length.to_s
                 
              
                puts "---------------------------------------------"
    
                puts "Clave Original es: " + pasar_cadena(claveB)
                puts "Clave Original en binario: " +   claveB
                puts "Longitud de la clave binario: " +   claveB.length.to_s
        
                puts "---------------------------------------------"
        
              
                puts "Mensaje cifrado: " 
                puts pasar_cadena(resul)
                puts "Mensaje cifrado en binario: " + resul
                puts "Longitud mensaje cifrado binario: " + resul.length.to_s
                
                return resul
                
            else 
                puts "NO PODEMOS CIFRAR CLAVE Y EL MENSAJE NO ES DEL MISMO TAMAÑO"
            end
        end
        
        
        
        
        #Cuando se cifra se le pasa un mensaje en cadena y una clave en binario puesta por nosotros
        # 8 bit por cada letra.
        def cifrar(mensaje,claveB)
            puts "\n\n"
            puts "CIFRANDO MENSAJE"
            puts "----------------"
            puts "\n"
            #Si el tamaño de la clave y del mensaje son iguales se puede hacer
            
            mensajeB = pasarBinario(mensaje)
            
            if (mensajeB.length == claveB.length) then
                
            
                #xor se le pasara dos cadnas binarias devuelve Binario.
                resul = xor(mensajeB,claveB)
            
                puts "Mensaje Original es: " + mensaje
                puts "Mensaje Original en binario: " + mensajeB
                puts "Longitud del mensaje en binario: " + mensajeB.length.to_s
                 
              
                puts "---------------------------------------------"
    
                puts "Clave Original es: " + pasar_cadena(claveB)
                puts "Clave Original en binario: " +   claveB
                puts "Longitud de la clave binario: " +   claveB.length.to_s
        
                puts "---------------------------------------------"
        
              
                puts "Mensaje cifrado: " 
                puts pasar_cadena(resul)
                puts "Mensaje cifrado en binario: " + resul
                puts "Longitud mensaje cifrado binario: " + resul.length.to_s
                
                return resul
                
            else 
                puts "NO PODEMOS CIFRAR CLAVE Y EL MENSAJE NO ES DEL MISMO TAMAÑO"
            end
        end
        
        #Siempre se le pasan dos datos en binario de caracter del mismo tamaño
        def xor(datoA,datoB)
            resul = ""
            
            
            tam = datoA.length - 1
                
            for i in 0..tam do
                resul << (datoA[i].to_i ^ datoB[i].to_i).to_s
            end
            
            return resul
        end
        
       
        #Los dos datos son cadena en binario
        def descifrar(mCifradoB,claveB)
            
            puts "\n\n"
            puts "DESCIFRANDO MENSAJE"
            puts "------------------"
            puts "\n"
            #Si el tamaño de la clave y del mensaje son iguales se puede hacer
           
            
            if (mCifradoB.length == claveB.length) then
                
                mCifradoC = pasar_cadena(mCifradoB)
                resul = xor(mCifradoB,claveB)
                
                puts "Mensaje Cifrado es: " + mCifradoC
                puts "Mensaje Cifrado en binario: " +  mCifradoB
                puts "Longitud del mensaje  en binario: " + mCifradoB.length.to_s
                
                puts "---------------------------------------------"
                
                claveC = pasar_cadena(claveB)  
                puts "Clave Original es: " + claveC
                puts "Clave Original en binario: " +   claveB
                puts "Longitud de la clave binario: " +   claveB.length.to_s
        
                puts "---------------------------------------------"
       
                puts "Mensaje descifrado: " 
                puts pasar_cadena(resul)
                puts "Mensaje descifrado en binario: " + resul
                puts "Longitud mensaje descifrado binario: " + resul.length.to_s
                
                #resultado en binario
                return resul
                
            else 
                puts "NO PODEMOS DECIFRAR CLAVE Y EL MENSAJE NO ES DEL MISMO TAMAÑO"
            end
        end
       
        #Pasamos un cadena de 0 y 1
        def pasar_cadena(cadena)
            letra = ""
            i = 0
            aux =""
           
            cadena.bytes do |c|
                # 32 es el espacio Se pone un 0 para que se de 8 bit
                i = i + 1
                if( i==8) then
                    aux << c
                    letra << aux.to_i(2).chr
                    aux =""
                    i=0
                elsif 
                
                     aux << c
                
                end
            
                # binario << "0" + c.to_s(2)
            end
            return letra
        end
end


class Mimenu
        
        def elige
            puts "ELIGE OPCIÓN"
            puts "0. Salir"
            puts "1. Cifrar"
            puts "2. Decifrar"
            
            STDOUT.flush  
            op = gets.chomp  
            op = op.to_i
            case op
               when 0 then "SALIR"
               when 1 then  menuCifrar
               when 2 then  menuDescifrar
               else "Error elija otra opcion recibida"
            end
            op.to_i
        end    
        
        def menuClave(tam)
              
            puts "Poner Clave en binario o darle a 0 para generar Clave aleatoria : "
            
            STDOUT.flush  
            claveB = gets.chomp  
            if ( claveB.to_i == 0) then
                maquina = Cifrador.new 
                claveB = maquina.generarClave(tam)
            end    
            claveB
            
        end
        
        def menuCifrar
            puts "Pon mensaje : "
            STDOUT.flush  
            mensaje = gets.chomp  
            
            claveB = menuClave(mensaje.length)
            maquina = Cifrador.new 
            mCifradoB = maquina.cifrar(mensaje,claveB)
            maquina.descifrar( mCifradoB , claveB )
        end
        
        def menuDescifrar
            puts "Pon mensaje cifrado : "
            STDOUT.flush  
            mensaje = gets.chomp  
            
            puts "Pon mensaje cifrado : "
            STDOUT.flush  
            claveB = gets.chomp  
          
            maquina = Cifrador.new 
            mCifradoB = maquina.pasarBinario(mensaje)
            maquina.descifrar( mCifradoB , claveB )
        end

end


maquina = Cifrador.new 

#Parte uno de la practica
mensaje = "SOL"
claveB="001111000001100001110011"
#claveB= maquina.generarClave(10);

mCifradoB = maquina.cifrar(mensaje,claveB)
maquina.descifrar( mCifradoB , claveB )

#p claveB
# 00111100 00011000 01110011
#claveB = maquina.pasar_cadena(claveB)
#p claveB

=begin
#Parte dos de la practica
claveB="0000111100100001"
mCifradoB = maquina.pasarBinario('[t')
maquina.descifrar( mCifradoB , claveB )
=end


#claveA=maquina.generarClave(2);
#p claveA

#menu = Mimenu.new
#op = 3

#while op != 0 do
#    p op
#    op = menu.elige
#end


#Modificacion 1.
mensaje ="VERNAM"
claveB = maquina.pasarBinario("SEGURO") 
mCifradoB = maquina.cifrar(mensaje,claveB)
maquina.descifrar( mCifradoB , claveB )


##Modificacion 2
maquina.cifradoxor(mensaje,claveB,1)

