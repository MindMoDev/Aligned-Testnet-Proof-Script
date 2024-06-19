echo "
🌟 This script is created by the team of DailyBucks. 🌟
For support, please join our Discord community at:
👉 https://discord.gg/dailybucks 👈
"
echo '
                                                                                
                            ..   ..           ,.    ,                           
                      ,..* /(/**************,,,,,,**(* *  .                     
                  ..* &(//*(&    *(.. .,. . ..#*    &/,,,*( *                   
              /,. @#(/&...**                         **   &,,,(   .             
            ,. @#(#../.                ,                  .*  /,,*              
         ,*(@%##..,   ......          .. .                    ,  /,*@, .        
        *(@&(%,*,  ..........        ,,. ..                     ,, &,*#,.       
      /.@&##,*  .............       ,,,. ,..                       * &**@..     
     * @%&,,. ...............      ,,,,. ,,,,                       ,. (*/ .    
   .,,&#*,.  ................     ,,,,,. ,,,,,                        ..(*/ ..  
  .,/%(... ..................... ,,,,,,, ,,,,,,                        .../(.,  
  , %(,.. ......................,,,,,,,, ,,,,,,,                 .....  ..,/#.* 
 ,,%((..  .....................,,,******.****,,,, .            .......   ,.((#.#
 ..(/,.. .....................**********.********* .....      .........  .../( *
 .(/&.*  ....................*****//////,/////***** ...................   *.((%,
 .//(..  ...................**///////((/,((///////**..................    ,.//#.
 .**(..   .................*////(((((((/*(((((((////* ...............     ,.//#.
  ,*#...    ..............////(((((####//####(((((//// ..........        *../*(.
  ,**       .............////((((##%%%%/(%%%%##((((//// .........          .**,.
   ,*%...    ...........*///((((##%%%%%((&%%%%##((((///* .......        . ./**  
    **# *.   ..........**///((((##%%%%&((&%%%%###(((///** ......       /. (,,   
   ..**% ..   ........***////(((##%%%%%#(%%%%%##((((///*** .....      ,  (,,    
     ./*&.. .   .....****////(((((##%%%%/%%%###((((////****.....     . .(,*     
      .*//, , ...........*/////((((((##&*##((((((/////*...........   *.((%.
        .%/(.., ............@////((((((&*((((((/////#............ . .*,/        
         (.&((,.. .........,,,,%#//((((&*((((//#%%,,,.........,.. ***(          
            ,&#/#...........,,,,,,&&.((&,((@&&&,,,,,,......*,...#***.           
              &,@(/&....  ....,,,****&&&/&&@****,,,.... ,...,(**#.              
                  ,.#((%/.,,,*. .*............./. ,*,,,.((///..                 
                      ,,/###(%** ,.%&%%%%%%&@%.,.//(((((,.,                     
                            *///@@@@@@@@@@@@@@@@&///*                           
'

# Update system and install necessary packages
echo "🔄 Updating the system and installing necessary packages..."
sudo apt update -y
sudo apt upgrade -y

echo "🔄 Installing curl..."
sudo apt-get install curl -y

# Install aligned
echo "🔄 Downloading and installing Aligned Layer tools..."
curl -L https://raw.githubusercontent.com/yetanotherco/aligned_layer/main/batcher/aligned/install_aligned.sh | bash
source /root/.bashrc

# Get proof test files
echo "🔄 Downloading proof test files..."
curl -L https://raw.githubusercontent.com/yetanotherco/aligned_layer/main/batcher/aligned/get_proof_test_files.sh | bash

# Submit proof
echo "🔄 Submitting proof..."
rm -rf ~/aligned_verification_data/ &&
aligned submit \
--proving_system SP1 \
--proof ~/.aligned/test_files/sp1_fibonacci.proof \
--vm_program ~/.aligned/test_files/sp1_fibonacci-elf \
--aligned_verification_data_path ~/aligned_verification_data \
--conn wss://batcher.alignedlayer.com

# Verify proof on-chain
echo "🔄 Verifying proof on-chain..."
aligned verify-proof-onchain \
--aligned-verification-data ~/aligned_verification_data/*.json \
--rpc https://ethereum-holesky-rpc.publicnode.com \
--chain holesky

echo "✅ Verification complete. Check the log for details."

# End of script
echo "🎉 Script execution finished. Thank you for using DailyBucks!"
