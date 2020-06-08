@extends('back.layouts.master')
@section('title','İş Takip - Silinen Ürünler')
@section('content')
<!-- Content Row -->
<div class="row">
    <!-- Earnings (Monthly) Card Example -->
    <div class="col-xl-12 col-md-12 mb-12">
        <div class="card shadow mb-4">
            <div class="card-header py-3">
              <h6 class="m-0 font-weight-bold text-primary"><strong>{{$products->count()}}</strong> Ürün Bulundu   
                <a href="{{route('admin.urunler.index')}}"  class="btn btn-primary btn-sm float-right"> <i class="fa fa-tresh"> Aktif Ürünler </i></a>
              </h6>
         
            </div>
            <div class="card-body">
              <div class="table-responsive">
                <table class="table table-bordered" id="tablo"  width="100%" cellspacing="0">
                  <thead>
                    <tr>
                        <th>Ürün Resim</th>
                      <th>Ürün Adı</th>
                   
                      <th>Oluşturulma Tarihi</th>
                      
                      <th>Silinme Tarihi</th>
                      <th></th>
                    </tr>
                  </thead>
                  <tbody>
                      @foreach ($products as $product)
                          
                    
                    <tr>
                    <td><img src="{{asset($product->image)}}"  width="200"></td>
                      <td>{{$product->name}}</td>
                      <td>{{$product->created_at->diffForHumans()}}</td>
                      <td>{{$product->deleted_at->diffForHumans()}}</td>
                      <td>
                        <a href="{{route('admin.recover.product',$product->id)}}" title="Silmekten Kurtar" class="btn btn-sm btn-primary"><i class="fa fa-recycle"></i> </a>
                        <a href="{{route('admin.hard.delete.product',$product->id)}}" title="Sil" class="btn btn-sm btn-danger"><i class="fa fa-times"></i> </a>
                      </td>
                    </tr>
                    @endforeach
                  </tbody>
                </table>
              </div>
            </div>
          </div>
    </div>

</div>

<!-- Content Row -->


@endsection

@section('css')

<link href="https://gitcdn.github.io/bootstrap-toggle/2.2.2/css/bootstrap-toggle.min.css" rel="stylesheet">
@endsection
@section('js')

<script src="https://gitcdn.github.io/bootstrap-toggle/2.2.2/js/bootstrap-toggle.min.js"></script>

<script>
  $(function() {
    $('.switch').change(function() {
     id = $(this)[0].getAttribute('data-id');
     statu=$(this).prop('checked');
     $.get("{{route('admin.switch')}}", { id:id , statu:statu}, function(data, status){
        console.log(data);
      });
    });
  });
</script>

@endsection