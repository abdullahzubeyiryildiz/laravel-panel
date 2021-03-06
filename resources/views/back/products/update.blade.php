@extends('back.layouts.master')
@section('title',$product->name.' - Ürünü Güncelle')
@section('content')
<!-- Content Row -->
<div class="row">
    <!-- Earnings (Monthly) Card Example -->
    <div class="col-xl-12 col-md-12 mb-12">
        <div class="card shadow mb-4">
            <div class="card-header py-3">
              <h6 class="m-0 font-weight-bold text-primary">@yield('title')</h6>
            </div>
            <div class="card-body">
                @if($errors->any())
                <div class="alert alert-danger">
                    @foreach($errors->all() as $error)
                      <li>{{$error}}</li>
                    @endforeach
                </div>
              @endif
             <form action="{{route('admin.urunler.update',$product->id)}}" method="POST" enctype="multipart/form-data">
                @method('PUT')
                @csrf
                <div class="form-group">
                  <label>Kategori</label>
                  <select class="form-control" name="category" required>
                      <option value="">Seçim Yapınız</option>
                      @foreach($categories as $category)
                        <option @if($product->category_id==$category->id) selected @endif  value="{{$category->id}}">{{$category->name}}</option>
                      @endforeach
                  </select>
              </div>
                 <div class="form-group">
                    <label>Ürün Adı</label>
                 <input type="text" name="name" value="{{$product->name}}" class="form-control" required>
                 </div>
                 <div class="form-group">
                    <label>Ürün Fotoğraf</label><br>
                    <img src="{{asset($product->image)}}" alt="" class="img-thumbnail raunded" width="400">
                    <input type="file" name="image" class="form-control">
                 </div>
                 <div class="form-group">
                    <label>İçeriği</label>
                    <textarea  id="editor" type="text" name="content"  class="form-control"> {!! $product->content !!} </textarea>
                 </div>
                 <div class="form-group">
                   <button type="submit" class="btn btn-primary btn-block"> Ürünü Güncelle </button>
                 </div>
             </form>
            </div>
          </div>
    </div>

</div>

<!-- Content Row -->


@endsection
@section('css')
<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.css" rel="stylesheet">
@endsection
@section('js')
<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.js"></script>
<script>
    $(document).ready(function() {
         $('#editor').summernote(
             {
                'height' : 200
             }
         );
    });
</script>
@endsection
