import std

pub fn dot_product<BITCOUNT: u32, VECTOR_LENGTH: u32>
  (a: sN[BITCOUNT][VECTOR_LENGTH], b: sN[BITCOUNT][VECTOR_LENGTH]) 
  -> sN[BITCOUNT]{
  
  //let _ = trace(IDX_BITS);
  for(idx, acc): (u32, sN[BITCOUNT])
    in range (u32:0, VECTOR_LENGTH) {
      
    let partial_product = a[idx] * b[idx];
    acc + partial_product
  } (sN[BITCOUNT]:0)
}

#![test]
fn dot_product_test() {
   let a = s32[4]:[1, 2, 3, 4];
   let b = s32[4]:[5, 6, 7, 8];
   let result = dot_product<u32:32, u32:4>(a, b);
   let _ = assert_eq(result, s32:70);

   let a = s8[2]:[1, 2];
   let b = s8[2]:[5, 6];
   let result = dot_product<u32:8, u32:2>(a, b);
   let _ = assert_eq(result, s8:17);
   ()
}

// We really only care about exporting fn dot_product, but 
// dslx_test is not happy unless it can find an entry
// function (it does not seem that a parametric function
// meets this requirement). So, we add a dummy main
// function which is also handy for inspecting the ir
// graph of a dot product.
fn main(a: s32[4], b: s32[4]) -> s32 {
  dot_product(a, b)
} 

