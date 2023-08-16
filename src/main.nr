use dep::std;
global PRIME: u32 = 16777619;


fn main(value: u32, hash_value: pub u32){
    let calculated_hash_value = calculate_hash(value);
    
    std::println(calculated_hash_value);
    assert(calculated_hash_value == hash_value);
}

fn calculate_hash(num: u32) -> u32 {

    let size: Field = 2.pow_32(32);
    let size_as_u32: u32 = size as u32;
    // std::println("size:");
    // std::println(size);

    let mut hash_value: u32 = 0x811C9DC5;
    // std::println("hash_value:");
    // std::println(hash_value);

    let prime = PRIME;
    // std::println("prime:");
    // std::println(prime);

    let num_as_field: Field = num as Field;
    let num_as_bytes = num_as_field.to_le_bytes(32);

    for i in 0..4 {                
        let product: u32 = (hash_value * prime) % size_as_u32;
        std::println("product");
        std::println(product);
        
        let byte_as_32: u32 = num_as_bytes[i] as u32;
        hash_value = product^byte_as_32;
        
    }
    
    // std::println("num_as_bytes length: ");
    // std::println(num_as_bytes.len());
    std::println("hash_value:");
    std::println(hash_value);
    hash_value
    
}



// #[test]
// fn test_0() {
//     let num = 127561628;
//     // let hash = calculate_hash(num);
//     calculate_hash(num);

//     // assert(hash == 0x71233de7);
// }

#[test]
fn test_1() {
    let num = 127561628;
    let hash = calculate_hash(num);

    std::println("the returned hash is:");
    std::println(hash);
    
    assert(hash == 0x71233de7);
}

#[test]
fn test_2() {
    let num = 237261828;
    let hash = calculate_hash(num);
    
    std::println("the returned hash is:");
    std::println(hash);

    assert(hash == 0x7F51D567);
}

#[test]
fn test_3() {
    let num = 596214892;
    let hash = calculate_hash(num);

    std::println("the returned hash is:");
    std::println(hash);

    assert(hash == 0x3F0C8995);
}

#[test]
fn test_print() {
    std::println("Outputs:");
    std::println("...");
    
    let num = 127561628;
    let num_test= (num as Field);

    std::println(num);
    std::println(num_test);

    assert(num == 127561628);
}